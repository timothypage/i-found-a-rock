defmodule Rock.TrailsTest do
  use Rock.DataCase

  alias Rock.Trails

  describe "trails" do
    alias Rock.Trails.Trail

    @valid_attrs %{description: "some description", high_rating: 42, low_rating: 42, name: "some name"}
    @update_attrs %{description: "some updated description", high_rating: 43, low_rating: 43, name: "some updated name"}
    @invalid_attrs %{description: nil, high_rating: nil, low_rating: nil, name: nil}

    def trail_fixture(attrs \\ %{}) do
      {:ok, trail} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trails.create_trail()

      trail
    end

    test "list_trails/0 returns all trails" do
      trail = trail_fixture()
      assert Trails.list_trails() == [trail]
    end

    test "get_trail!/1 returns the trail with given id" do
      trail = trail_fixture()
      assert Trails.get_trail!(trail.id) == trail
    end

    test "create_trail/1 with valid data creates a trail" do
      assert {:ok, %Trail{} = trail} = Trails.create_trail(@valid_attrs)
      assert trail.description == "some description"
      assert trail.high_rating == 42
      assert trail.low_rating == 42
      assert trail.name == "some name"
    end

    test "create_trail/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trails.create_trail(@invalid_attrs)
    end

    test "update_trail/2 with valid data updates the trail" do
      trail = trail_fixture()
      assert {:ok, trail} = Trails.update_trail(trail, @update_attrs)
      assert %Trail{} = trail
      assert trail.description == "some updated description"
      assert trail.high_rating == 43
      assert trail.low_rating == 43
      assert trail.name == "some updated name"
    end

    test "update_trail/2 with invalid data returns error changeset" do
      trail = trail_fixture()
      assert {:error, %Ecto.Changeset{}} = Trails.update_trail(trail, @invalid_attrs)
      assert trail == Trails.get_trail!(trail.id)
    end

    test "delete_trail/1 deletes the trail" do
      trail = trail_fixture()
      assert {:ok, %Trail{}} = Trails.delete_trail(trail)
      assert_raise Ecto.NoResultsError, fn -> Trails.get_trail!(trail.id) end
    end

    test "change_trail/1 returns a trail changeset" do
      trail = trail_fixture()
      assert %Ecto.Changeset{} = Trails.change_trail(trail)
    end
  end
end
