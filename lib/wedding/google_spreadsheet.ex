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

    case HTTPoison.get(url) |> IO.inspect() do
      {:ok, %{body: data, status_code: 200}} ->
        {:ok, data |> Jason.decode!() |> Map.get("values")}

      _ ->
        :error
    end
  end

  def update_invitee_response(row, entries) do
    update_invitee_and_party_response(row, entries)
  end

  def update_invitee_and_party_response(row_index, coming?) do
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

    HTTPoison.post(url, body, [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{get_access_token()}"}
    ])
  end

  def get_access_token do
    {:ok, %{token: token}} =
      Goth.Token.fetch(
        source:
          {:service_account, File.read!("./config/service_account.json") |> Jason.decode!(),
           scopes: [@scope]}
      )

    token
  end
end
