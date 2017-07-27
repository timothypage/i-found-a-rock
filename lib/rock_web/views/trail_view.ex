defmodule RockWeb.TrailView do
  use RockWeb, :view
  use Rummage.Phoenix.View


  def length_in_miles(length_in_feet) when is_integer(length_in_feet) do
    :erlang.float_to_binary( length_in_feet / 5280, decimals: 2 )
  end

  def length_in_miles(_) do
    "-"
  end
end
