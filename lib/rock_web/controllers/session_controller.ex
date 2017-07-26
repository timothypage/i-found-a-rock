defmodule RockWeb.SessionController do
  use RockWeb, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{
    "username" => username,
    "password" => password
  }}) do
    case Rock.Auth.login_by_username_and_pass(
      conn,
      username,
      password,
      repo: Rock.Repo
    ) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome Back!")
        |> redirect(to: page_path(conn, :index))

      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Rock.Auth.logout
    |> redirect(to: page_path(conn, :index))
  end
end
