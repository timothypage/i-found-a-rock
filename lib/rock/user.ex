defmodule Rock.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rock.User


  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :hashed_password, :string
    field :username, :string
    field :admin, :boolean

    timestamps()
  end

  def registration_changeset(%User{} = user, attrs) do
    user
    |> changeset(attrs)
    |> cast(attrs, [:password])
    |> validate_length(:password, min: 6, max: 100)
    |> put_password_hash
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :username])
    |> validate_required([:email, :username])
    |> validate_length(:username, min: 1, max: 25)
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change( changeset, :hashed_password, Comeonin.Argon2.hashpwsalt(password) )
      _ -> changeset
    end
  end
end
