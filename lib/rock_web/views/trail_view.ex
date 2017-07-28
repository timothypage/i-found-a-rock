defmodule RockWeb.TrailView do
  use RockWeb, :view
  use Rummage.Phoenix.View

  def length_in_miles(length_in_feet) when is_integer(length_in_feet) do
    :erlang.float_to_binary( length_in_feet / 5280, decimals: 2 )
  end

  def length_in_miles(_) do
    "-"
  end

  def include_ckeditor do
    ~E(<script src="//cdn.ckeditor.com/4.7.1/basic/ckeditor.js"></script>)
  end

  def render("scripts_before.new.html", _assigns) do
    include_ckeditor()
  end

  def render("scripts_before.edit.html", _assigns) do
    include_ckeditor()
  end

  def trail_scores do
    [
      rock_crawling_score: "Rock Crawling",
      sand_and_mud_score: "Sand and Mud",
      water_crossings_score: "Water Crossings",
      playgrounds_score: "Playgrounds",
      cliffs_and_ledges_score: "Cliffs and Ledges",
      steep_hills_score: "Steep Hills",
      scenery_score: "Scenery",
    ]
  end
end
