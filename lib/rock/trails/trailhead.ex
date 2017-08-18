defmodule Rock.Trails.Trailhead do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rock.Trails.Trail
  alias Rock.Trails.Trailhead


  schema "trailheads" do
    field :name, :string
    field :description, :string
    field :latitude, :float
    field :longitude, :float

    many_to_many :trails, Trail, join_through: "trails_trailheads"
  end

  def changeset(%Trailhead{} = trailhead, attrs) do
    trailhead
    |> cast(attrs, [
      :name,
      :description,
      :latitude,
      :longitude
    ])
    |> validate_required([:name])
  end
end
