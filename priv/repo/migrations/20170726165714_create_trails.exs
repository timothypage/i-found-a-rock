defmodule Rock.Repo.Migrations.CreateTrails do
  use Ecto.Migration

  def change do
    create table(:trails) do
      add :name, :string
      add :description, :text
      add :type, :string
      add :length, :integer

      add :difficulty_high,       :integer
      add :difficulty_low,        :integer

      add :rock_crawling_score,   :integer
      add :sand_and_mud_score,    :integer
      add :water_crossings_score, :integer
      add :playgrounds_score,     :integer
      add :cliffs_and_ledges_score,     :integer
      add :steep_hills_score,     :integer
      add :scenery_score,         :integer

      add :directions_to_trailhead, :text
      add :meeting_place,           :text

      timestamps()
    end

  end
end
