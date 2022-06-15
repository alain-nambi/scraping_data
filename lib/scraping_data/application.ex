defmodule ScrapingData.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ScrapingData.Repo,
      # Start the Telemetry supervisor
      ScrapingDataWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ScrapingData.PubSub},
      # Start the Endpoint (http/https)
      ScrapingDataWeb.Endpoint
      # Start a worker by calling: ScrapingData.Worker.start_link(arg)
      # {ScrapingData.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ScrapingData.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ScrapingDataWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
