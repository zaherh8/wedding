defmodule Wedding.InviteesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Wedding.Invitees` context.
  """

  @doc """
  Generate a invitee.
  """
  def invitee_fixture(attrs \\ %{}) do
    {:ok, invitee} =
      attrs
      |> Enum.into(%{
        coming: true,
        first_name: "some first_name",
        group: "some group",
        last_name: "some last_name"
      })
      |> Wedding.Invitees.create_invitee()

    invitee
  end
end
