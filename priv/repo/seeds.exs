# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
# invitees =
#   File.read!("lib/wedding/invitees_backup.csv")
#   |> String.trim()
#   |> String.split("\n")
#   |> Enum.map(fn row ->
#     invitee =
#       row |> String.trim() |> String.trim(",") |> String.split(",") |> IO.inspect(label: "row")

#     coming? =
#       cond do
#         Enum.at(invitee, 3) == "TRUE" -> true
#         Enum.at(invitee, 3) == "FALSE" -> false
#         true -> nil
#       end

#     %{
#       first_name: Enum.at(invitee, 0),
#       last_name: Enum.at(invitee, 1),
#       group: Enum.at(invitee, 2),
#       coming: coming?
#     }
#   end)

# File.write!("priv/repo/seed.ex", inspect(invitees, limit: :infinity))
#  Wedding.Repo.insert_all(Wedding.Invitees.Invitee, invitees, on_conflict: :nothing)
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
