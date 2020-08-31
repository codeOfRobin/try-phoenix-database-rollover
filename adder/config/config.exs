# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :adder,
  ecto_repos: [Adder.Repo]

# Configures the endpoint
config :adder, AdderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ubYFw7Vi4kLYXBUyLnHepAj5nna+PrJDT51Vc6pCK2ImCEm0zogJAVZqihoPJEq2",
  render_errors: [view: AdderWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Adder.PubSub,
  live_view: [signing_salt: "1Wl98UjU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
