defmodule SimpleHttp.Router do
    use Plug.Router
  
    plug Plug.Logger
    plug :match
    plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
    plug :dispatch
  
    get "/hello" do
      conn
        |> put_resp_content_type("application/json", "utf-8")
        |> send_resp(200, processName(extractNameFromBody(conn.body_params)))
    end
  
    match _ do
      send_resp(conn, 404, "Not Found")
    end

    defp extractNameFromBody(body) do
      case body do
        %{"name" => name} -> name
        _ -> "World"
      end
    end

    defp processName(name) do
      Poison.encode!(%{msg: "Hello, #{name}!"})
    end
end