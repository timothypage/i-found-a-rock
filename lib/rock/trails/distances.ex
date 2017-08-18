defmodule Rock.Trails.Distances do
  def compute_distances(from) do
    trails = Rock.Trails.list_trails_for_distance()

    trails
    |> Stream.map(fn trail -> compute_distance(from, trail) end)
    |> Stream.reject(fn trail -> trail.distance == nil end)
    |> Enum.sort_by(fn trail -> trail.distance end)
  end

  def compute_distance(from, trail) do
    url = "http://localhost:5000/route/v1/driving/#{from};#{trail[:long]},#{trail[:lat]}?overview=false"

  	distance = case HTTPoison.get( url )do
  	  {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> get_distance_from_body(body)
      _ -> nil
    end

    Map.put(trail, :distance, distance)
  end

  def get_distance_from_body(body) do
    {:ok, data} = Poison.decode(body)
    data
    |> Map.get("routes")
    |> List.first
    |> Map.get("distance")
  end
end
