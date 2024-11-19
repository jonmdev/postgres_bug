defmodule PostgresBug.MixProject do
  use Mix.Project

  def project do
    [
      app: :postgres_bug,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto, :ssl],
      mod: {PostgresBug.Application, []},
      env: [type_server_reap_after: 3 * 60_000, json_library: Jason]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :docs},
      {:jason, "~> 1.0", optional: true},
      {:table, "~> 0.1.0", optional: true},
      {:decimal, "~> 1.5 or ~> 2.0"},
      {:db_connection, "~> 2.1"}

      # {:postgrex, "~> 0.19.2"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
