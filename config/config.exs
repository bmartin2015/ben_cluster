# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :ben_cluster, BenClusterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kS/lMMx8w6bEPUtooz40RffV4Slict5TV5+qLF2Y7D2RGPCz/T6ayeXexlI2MMss",
  render_errors: [view: BenClusterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BenCluster.PubSub,
  live_view: [signing_salt: "A3M6nSPM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
