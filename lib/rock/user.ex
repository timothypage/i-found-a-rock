defmodule Rock.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rock.User


  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :hashed_password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :username, :hashed_password])
    |> validate_required([:email, :username, :hashed_password])
  end
end
