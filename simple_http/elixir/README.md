# KPEX/simple_http/elixir

**A simple HTTP server written in Elixir using functional programming.**  

Takes a json body with a name and returns a json greeting the person with that name. If the name or the body is not present it will assume the name is "World".

Input:

```json
{ "name": "Server" }
```

Output:

```json
{ "msg": "Hello, Server!" }
```

## Start

```bash
mix run --no-halt
```

<!-- Only required if published via the hex package manager

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `example` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:example, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/example](https://hexdocs.pm/example).

-->
