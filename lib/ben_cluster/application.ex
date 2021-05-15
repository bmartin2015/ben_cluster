defmodule BenCluster.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies) || []

    children = [
      # Start the Telemetry supervisor
      BenClusterWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BenCluster.PubSub},
      # start libcluster
      {Cluster.Supervisor, [topologies, [name: ElixirClusterDemo.ClusterSupervisor]]},
      # Start the Endpoint (http/https)
      BenClusterWeb.Endpoint
      # Start a worker by calling: BenCluster.Worker.start_link(arg)
      # {BenCluster.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BenCluster.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BenClusterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
