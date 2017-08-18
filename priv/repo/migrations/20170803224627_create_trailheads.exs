defmodule Rock.Repo.Migrations.CreateTrailheads do
  use Ecto.Migration

  def change do
    create table(:trailheads) do
      add :name, :string
      add :description, :text
      add :latitude, :float
      add :longitude, :float
    end
  end
end
