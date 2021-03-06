# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rock,
  ecto_repos: [Rock.Repo]

# Configures the endpoint
config :rock, RockWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SdCFs4rK8iJQoLhWMVBR2ZLDbbGW2kYLskBgGyCPMFPlKgU3wsl9elMn3Ut7vSRJ",
  render_errors: [view: RockWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rock.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :rummage_ecto, Rummage.Ecto,
  default_repo: Rock.Repo,
  default_per_page: 50

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
