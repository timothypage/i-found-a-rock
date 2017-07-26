defmodule Rock.Repo.Migrations.CreateTrails do
  use Ecto.Migration

  def change do
    create table(:trails) do
      add :name, :string
      add :high_rating, :integer
      add :low_rating, :integer
      add :description, :text

      timestamps()
    end

  end
end
