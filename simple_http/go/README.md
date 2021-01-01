# KPEX/simple_http/go

**A simple HTTP server written in Go using functional programming.**  

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
go run server.go
```
