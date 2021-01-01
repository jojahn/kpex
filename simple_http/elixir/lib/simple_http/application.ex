defmodule SimpleHttp.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: SimpleHttp.Router, options: [port: 8080]}
    ]
    opts = [strategy: :one_for_one, name: SimpleHttp.Supervisor]

    Logger.info("Starting Simple HTTP Server on http://localhost:8080/hello ...")

    Supervisor.start_link(children, opts)
  end
end