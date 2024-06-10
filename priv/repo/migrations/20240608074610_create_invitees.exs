defmodule Wedding.Repo.Migrations.CreateInvitees do
  use Ecto.Migration

  def change do
    create table(:invitees) do
      add :first_name, :string
      add :last_name, :string
      add :group, :string
      add :coming, :boolean
    end

    create(
      unique_index(
        :invitees,
        [:first_name, :last_name],
        name: :invitees_first_name_last_name_index
      )
    )
  end
end
