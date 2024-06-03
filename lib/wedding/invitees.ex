defmodule Wedding.Invitees do
  @moduledoc """
  This module represents invitees
  """
  defstruct [:first_name, :last_name, :group, :response, :row]

  def get_invitee_and_party(first_name, last_name) do
    with {:ok, invitees_list} when is_list(invitees_list) <-
           Wedding.GoogleSpreadsheet.get_invitees(),
         invitees_list <- invitees_list |> Enum.with_index(&parse_invitee/2),
         {invitee, rest_of_invitees} <-
           Enum.split_with(
             invitees_list,
             &((&1.first_name == first_name) &&
                (&1.last_name) == last_name)
           ),
         [invitee | _] <- invitee do
      group = Enum.filter(rest_of_invitees, &(invitee.group && invitee.group == &1.group))
      {:ok, [invitee] ++ group}
    else
      _ ->
        {:error, :not_found}
    end
  end

  defp parse_invitee(invitee, index) do
   [first_name, last_name] = Wedding.format_names(Enum.take(invitee, 2))
    %Wedding.Invitees{
      first_name: first_name,
      last_name: last_name,
      group: invitee |> Enum.at(2),
      response: invitee |> Enum.at(3),
      row: index
    }
  end

  def update_invitees(invitees) when is_list(invitees) do
    if Enum.all?(
         invitees,
         &(Wedding.GoogleSpreadsheet.update_invitee_response(
             &1.row |> String.to_integer(),
             &1.response
           )
           |> elem(1)
           |> Map.get(:status_code) == 200)
       ) do
      :ok
    else
      :error
    end
  end
end
