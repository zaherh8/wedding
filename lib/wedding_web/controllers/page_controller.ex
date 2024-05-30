defmodule WeddingWeb.PageController do
  use Phoenix.Controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def rsvp(conn, %{"first_name" => first_name, "last_name" => last_name}) do
    case Wedding.Invitees.get_invitee_and_party(first_name, last_name)
         |> IO.inspect(label: "party?") do
      {:ok, invitees} ->
        render(conn, "index.html", invitees: invitees)

      _ ->
        render(conn, "index.html", invitees: [])
    end
  end

  def confirm_rsvp(conn, params) do
    invitees =
      Enum.group_by(params, fn {key, _} -> String.at(key, -1) end, fn {key, value} ->
        {String.slice(key, 0..-2) |> String.to_atom(), value}
      end)
      |> Enum.map(fn {_, data} -> struct(%Wedding.Invitees{}, data |> Map.new()) end)

    Wedding.Invitees.update_invitees(invitees)

    coming? = Enum.all?(invitees, & &1.response == "true")
    message =  if coming?, do: "Thank you! See you at Swanlake", else: "Thank you for your response!"
    render(conn |> put_flash(:info,  message), "index.html")
  end
end
