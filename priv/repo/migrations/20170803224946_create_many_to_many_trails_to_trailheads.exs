defmodule Rock.Repo.Migrations.CreateManyToManyTrailsToTrailheads do
  use Ecto.Migration

  def change do
    create table(:trails_trailheads, primary_key: false) do
      add :trail_id, references(:trails)
      add :trailhead_id, references(:trailheads)
    end
  end
end
