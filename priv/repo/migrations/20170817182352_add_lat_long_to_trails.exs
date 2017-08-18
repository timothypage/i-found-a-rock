defmodule Rock.Repo.Migrations.AddLatLongToTrails do
  use Ecto.Migration

  def change do
    alter table(:trails) do
      add :approx_trail_location_lat, :float
      add :approx_trail_location_long, :float
    end
  end
end
