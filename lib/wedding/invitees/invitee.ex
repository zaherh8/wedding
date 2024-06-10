defmodule Wedding.Invitees.Invitee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invitees" do
    field(:coming, :boolean, default: nil)
    field(:first_name, :string)
    field(:group, :string)
    field(:last_name, :string)
  end

  @doc false
  def changeset(invitee, attrs) do
    invitee
    |> cast(attrs, [:first_name, :last_name, :group, :coming])
    |> validate_required([:first_name, :last_name])
  end
end
