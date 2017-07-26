defmodule RockWeb.TrailControllerTest do
  use RockWeb.ConnCase

  alias Rock.Trails

  @create_attrs %{description: "some description", high_rating: 42, low_rating: 42, name: "some name"}
  @update_attrs %{description: "some updated description", high_rating: 43, low_rating: 43, name: "some updated name"}
  @invalid_attrs %{description: nil, high_rating: nil, low_rating: nil, name: nil}

  def fixture(:trail) do
    {:ok, trail} = Trails.create_trail(@create_attrs)
    trail
  end

  describe "index" do
    test "lists all trails", %{conn: conn} do
      conn = get conn, trail_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Trails"
    end
  end

  describe "new trail" do
    test "renders form", %{conn: conn} do
      conn = get conn, trail_path(conn, :new)
      assert html_response(conn, 200) =~ "New Trail"
    end
  end

  describe "create trail" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, trail_path(conn, :create), trail: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == trail_path(conn, :show, id)

      conn = get conn, trail_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Trail"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, trail_path(conn, :create), trail: @invalid_attrs
      assert html_response(conn, 200) =~ "New Trail"
    end
  end

  describe "edit trail" do
    setup [:create_trail]

    test "renders form for editing chosen trail", %{conn: conn, trail: trail} do
      conn = get conn, trail_path(conn, :edit, trail)
      assert html_response(conn, 200) =~ "Edit Trail"
    end
  end

  describe "update trail" do
    setup [:create_trail]

    test "redirects when data is valid", %{conn: conn, trail: trail} do
      conn = put conn, trail_path(conn, :update, trail), trail: @update_attrs
      assert redirected_to(conn) == trail_path(conn, :show, trail)

      conn = get conn, trail_path(conn, :show, trail)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, trail: trail} do
      conn = put conn, trail_path(conn, :update, trail), trail: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Trail"
    end
  end

  describe "delete trail" do
    setup [:create_trail]

    test "deletes chosen trail", %{conn: conn, trail: trail} do
      conn = delete conn, trail_path(conn, :delete, trail)
      assert redirected_to(conn) == trail_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, trail_path(conn, :show, trail)
      end
    end
  end

  defp create_trail(_) do
    trail = fixture(:trail)
    {:ok, trail: trail}
  end
end
