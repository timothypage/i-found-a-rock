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
end
