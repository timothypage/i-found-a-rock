defmodule Rock.Repo.Migrations.CreateInvites do
  use Ecto.Migration

  def change do
    create table(:invites) do
      add :invitation_token, :string
      add :claimed_by_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:invites, [:claimed_by_id])
  end
end
