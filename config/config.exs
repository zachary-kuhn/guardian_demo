# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :guardian_demo, GuardianDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rOyHVG0IDCpiM8NFFYUlHvdCQigh+p4jpcTIUo0Ivzr2ba203UaCllGp/6XrtVOA",
  render_errors: [view: GuardianDemoWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GuardianDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian_demo, GuardianDemo.Guardian,
  issuer: "guardian_demo",
  secret_key: {:system, "GUARDIAN_DEMO_SECRET_KEY"}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
