defmodule Wedding.GoogleSpreadsheet do
  @moduledoc """
  This module is responsible for fetching data from the Google Spreadsheet.
  """
  @spreadsheet_id "1GIUJXTP7c86cL5znS7JYLi7go88SQhV3nonWdSww28g"
  @api_key "AIzaSyDns8zFnhE-tZ0SfSxOTQlbyRCKUabziic"
  @scope "https://www.googleapis.com/auth/spreadsheets"
  def get_invitees do
    url =
      "https://sheets.googleapis.com/v4/spreadsheets/#{@spreadsheet_id}/values/Sample!A1:D191?key=#{@api_key}"

    case HTTPoison.get(url) do
      {:ok, %{body: data, status_code: 200}} ->
        {:ok, data |> Jason.decode!() |> Map.get("values")}

      _ ->
        :error
    end
  end

  def update_invitee_response(row_index, coming?) do
    url = "https://sheets.googleapis.com/v4/spreadsheets/#{@spreadsheet_id}:batchUpdate"

    body =
      %{
        "requests" => [
          %{
            "updateCells" => %{
              "range" => %{
                "sheetId" => 0,
                "startRowIndex" => row_index,
                "endRowIndex" => row_index + 1,
                "startColumnIndex" => 3,
                "endColumnIndex" => 4
              },
              "rows" => [
                %{
                  "values" => [
                    %{
                      "userEnteredValue" => %{"boolValue" => coming?},
                      "dataValidation" => %{
                        "condition" => %{
                          "type" => "BOOLEAN"
                        }
                      }
                    }
                  ]
                }
              ],
              "fields" => "userEnteredValue,dataValidation"
            }
          }
        ]
      }
      |> Jason.encode!()

    case get_access_token() do
      :error ->
        :error

      token ->
        HTTPoison.post(url, body, [
          {"Content-Type", "application/json"},
          {"Authorization", "Bearer #{token}"}
        ])
    end
  end

  def get_access_token do
    case Goth.Token.fetch(source: {:service_account, service_account(), scopes: [@scope]}) do
      {:ok, %{token: token}} ->
        token

      _ ->
        :error
    end
  end

  def service_account do
    Application.get_env(:wedding, :google_service_account)
  end
end
