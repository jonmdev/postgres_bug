defmodule PostgresBug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do

    #===============================
    #POSTGREX TEST (ADDED CODE)
    #===============================
    children = [{
      Postgrex,
      hostname: "localhost",
      port: 5432,
      username: "root",
      password: "password",
      database: "mydb",
      show_sensitive_data_on_connection_error: true,
      parameters: [{:preferQueryMode, "simple" }],

    }]

    opts = [strategy: :one_for_one, name: My.PostgresSupervisor] # restart options for the supervisor, not relevant
    start_result = Supervisor.start_link(children, opts)  # start the Postgres connection based on tuple configuration above

    IO.puts("STARTED POSTGRES WITH STATUS: " <> inspect(start_result))


    #===============================
    #DEFAULT START PROGRAM
    #===============================
    children = [
      # Starts a worker by calling: PostgresBug.Worker.start_link(arg)
      # {PostgresBug.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PostgresBug.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
