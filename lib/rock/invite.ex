defmodule Rock.Invite do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rock.Invite


  schema "invites" do
    field :invitation_token, :string
    field :claimed_by, :id

    timestamps()
  end

  @doc false
  def changeset(%Invite{} = invite, attrs) do
    invite
    |> cast(attrs, [:invitation_token])
    |> validate_required([:invitation_token])
  end
end
