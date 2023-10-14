defmodule WechatPayDemo.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WechatPayDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WechatPayDemo.PubSub},
      # Start the Endpoint (http/https)
      WechatPayDemoWeb.Endpoint,
      WechatPayDemo.PayClient
    ]

    opts = [strategy: :one_for_one, name: WechatPayDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WechatPayDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end