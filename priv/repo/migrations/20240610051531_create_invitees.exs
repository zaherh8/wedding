defmodule Wedding.Repo.Migrations.CreateInvitees do
  use Ecto.Migration

  def change do
    create table(:invitees) do
      add :group, :string
      add :last_name, :string
      add :coming, :boolean, default: false, null: false
      add :first_name, :string

      timestamps()
    end
  end
end
