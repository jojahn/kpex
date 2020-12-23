defmodule KPEX.IO do
    @spec read_file(String) :: String
    def read_file(path) do
        {_ok, content} = File.read(path)
        content
    end

    use Application
    def start(_type, _args) do
        IO.puts "Hello, World!"
        Task.start(fn -> :timer.sleep(1000); IO.puts("done sleeping") end)
    end
end