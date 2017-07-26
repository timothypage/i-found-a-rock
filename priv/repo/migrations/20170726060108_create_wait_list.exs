defmodule Rock.Repo.Migrations.CreateWaitList do
  use Ecto.Migration

  def change do
    create table(:wait_list) do
      add :email, :string

      timestamps()
    end

  end
end
