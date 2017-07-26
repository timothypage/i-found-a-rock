defmodule Rock.WaitList do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rock.WaitList


  schema "wait_list" do
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(%WaitList{} = wait_list, attrs) do
    wait_list
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
