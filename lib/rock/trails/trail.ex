defmodule Rock.Trails.Trail do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rock.Trails.Trail


  schema "trails" do
    field :name, :string
    field :description, :string
    field :type, :string
    field :length, :integer

    field :difficulty_high,       :integer
    field :difficulty_low,        :integer

    field :rock_crawling_score,   :integer
    field :sand_and_mud_score,    :integer
    field :water_crossings_score, :integer
    field :playgrounds_score,     :integer
    field :cliffs_and_ledges_score,     :integer
    field :steep_hills_score,     :integer
    field :scenery_score,         :integer

    field :directions_to_trailhead, :string
    field :meeting_place, :string

    timestamps()
  end

  @doc false
  def changeset(%Trail{} = trail, attrs) do
    trail
    |> cast(attrs, [
      :name,
      :difficulty_low,
      :difficulty_high,
      :description
    ])
    |> sanitize(:description)
    |> sanitize(:meeting_place)
    |> sanitize(:directions_to_trailhead)
    |> validate_required([:name, :difficulty_low, :difficulty_high, :description])
  end

  def sanitize(%Ecto.Changeset{} = changeset, field) do
    if Map.has_key?( changeset.changes, field ) do
      {:safe, sanitized_field} = PhoenixHtmlSanitizer.Helpers.sanitize(changeset.changes[field], :basic_html)

      changeset
      |> Ecto.Changeset.put_change(
          field,
          sanitized_field
        )
    else
      changeset
    end
  end
end
