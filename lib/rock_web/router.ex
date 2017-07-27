defmodule RockWeb.Router do
  use RockWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Rock.Auth, repo: Rock.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RockWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/sessions", SessionController, only: [:new, :create, :delete]

    resources "/trails", TrailController

    resources "/waiting-list", WaitListController, only: [:new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", RockWeb do
  #   pipe_through :api
  # end
end
