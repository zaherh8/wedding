defmodule Wedding.Invitees do
  @moduledoc """
  This module represents invitees
  """
  defstruct [:first_name, :last_name, :group, :response, :row]

  def get_invitee_and_party(first_name, last_name) do
    with {:ok, invitees_list} when is_list(invitees_list) <-
           Wedding.GoogleSpreadsheet.get_invitees(),
         invitees_list <- invitees_list |> Enum.with_index(&parse_invitee/2) |> IO.inspect,
         {invitee, rest_of_invitees} <-
           Enum.split_with(
             invitees_list,
             &(String.downcase(&1.first_name) == String.downcase(first_name) &&
                 String.downcase(&1.last_name) == String.downcase(last_name))
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
    %Wedding.Invitees{
      first_name: invitee |> Enum.at(0) |> String.downcase(),
      last_name: invitee |> Enum.at(1) |> String.downcase(),
      group: invitee |> Enum.at(2),
      response: invitee |> Enum.at(3),
      row: index
    }
  end

  def update_invitees(invitees) when is_list(invitees) do
    Enum.each(invitees, &Wedding.GoogleSpreadsheet.update_invitee_response(&1.row |> String.to_integer(), &1.response))
  end
end
