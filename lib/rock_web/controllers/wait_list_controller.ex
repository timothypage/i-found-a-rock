defmodule RockWeb.WaitListController do
  use RockWeb, :controller

  alias Rock.WaitList

  def new(conn, _params) do
    changeset = WaitList.changeset(%WaitList{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    changeset = WaitList.changeset(%WaitList{}, params["wait_list"])

    case Rock.Repo.insert(changeset) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "You're signed up!")
        |> put_resp_cookie("signed_up_for_wait_list", "true")
        |> redirect(to: page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)

    end
  end
end
