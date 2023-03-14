defmodule Phxlite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxliteWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Phxlite.PubSub},
      # Start Finch
      {Finch, name: Phxlite.Finch},
      # Start the Endpoint (http/https)
      PhxliteWeb.Endpoint
      # Start a worker by calling: Phxlite.Worker.start_link(arg)
      # {Phxlite.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phxlite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxliteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
