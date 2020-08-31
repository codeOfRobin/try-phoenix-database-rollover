defmodule Adder.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Adder.Repo,
      # Start the Telemetry supervisor
      AdderWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Adder.PubSub},
      # Start the Endpoint (http/https)
      AdderWeb.Endpoint
      # Start a worker by calling: Adder.Worker.start_link(arg)
      # {Adder.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Adder.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AdderWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
