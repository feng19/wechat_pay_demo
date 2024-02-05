defmodule WechatPayDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :wechat_pay_demo,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {WechatPayDemo.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.7.7"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:wechat, "~> 0.14", hex: :wechat_sdk},
      {:x509, "~> 0.8"},
      {:cachex, "~> 3.6"}
    ]
  end

  defp aliases do
    [setup: ["deps.get"]]
  end
end
