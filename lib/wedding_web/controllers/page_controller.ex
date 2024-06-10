defmodule WeddingWeb.PageController do
  use Phoenix.Controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def rsvp(conn, %{"first_name" => first_name, "last_name" => last_name}) do
    [first_name, last_name] = Wedding.format_names([first_name, last_name])

    case Wedding.Invitees.get_invitee_and_party(first_name, last_name) do
      {:ok, invitees} ->
        render(conn, "index.html", anchor: "anchor", invitees: invitees)

      {:error, :not_found} ->
        render(conn, "index.html",
          anchor: "firstform",
          form_error:
            "Sorry, we couldn't find you. Please try again. \n If you still have trouble, please contact Zaher."
        )
    end
  end

  def confirm_rsvp(conn, params) do
    invitees =
      Enum.group_by(params, fn {key, _} -> String.at(key, -1) end, fn {key, value} ->
        {String.slice(key, 0..-2) |> String.to_atom(), value}
      end)
      |> Enum.map(fn {_, data} -> data |> Map.new() |> Map.take([:coming, :id]) end)

    success? = Wedding.Invitees.update_invitees(invitees) == :ok

    if success? do
      coming? = Enum.any?(invitees, & &1.coming)

      message =
        if coming?, do: "Thank you! See you at Swanlake", else: "Thank you for your response!"

      render(conn |> put_flash(:info, message), "index.html")
    else
      error = "Sorry, your reservation failed! Please try again."
      render(conn |> put_flash(:error, error), "index.html")
    end
  end
end
