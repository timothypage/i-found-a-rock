defmodule RockWeb.PageController do
  use RockWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
