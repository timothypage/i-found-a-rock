defmodule Rock.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :username, :string
      add :hashed_password, :string
      add :admin, :boolean

      timestamps()
    end

  end
end
