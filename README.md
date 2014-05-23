# Primy

Open one terminal, do this:

```
iex --sname server server.ex
```

In another terminal, do this:

```
iex --sname w1 worker.ex
```

In _yet_ another terminal, do this:

```
iex --sname w2 worker.ex
```

## Connecting the Nodes together

On the `server@hostname` node:

```
iex> Node.connect :'w1@hostname'
true
iex> Node.connect :'w2@hostname'
true
```

## Running it

On the `server@hostname` node:

```
iex> Server.start
```

On each of the worker nodes, do this as many times as you like:

```
iex> Worker.start
```
