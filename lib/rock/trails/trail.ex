defmodule Rock.Trails.Trail do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rock.Trails.Trail


  schema "trails" do
    field :description, :string
    field :high_rating, :integer
    field :low_rating, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Trail{} = trail, attrs) do
    trail
    |> cast(attrs, [:name, :high_rating, :low_rating, :description])
    |> validate_required([:name, :high_rating, :low_rating, :description])
  end
end
