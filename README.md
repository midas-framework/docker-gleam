# docker-gleam

**Docker image for Gleam**

Gleam is a statically typed functional programming language for building scalable concurrent systems. It compiles to Erlang and has straightforward interop with other BEAM languages such as Erlang, Elixir and LFE.

### Run a container

```
docker run --rm gleamlang/gleam gleam --version
```

### Create a new Gleam project

```
docker run --rm -v "$PWD":/opt/app -w /opt/app gleamlang/gleam gleam new my_app
```

### Contributing

Build the image.

```
docker build -t gleamlang/gleam[:<tag>] .
```

Publish the image.

```
docker push gleamlang/gleam[:<tag>]
```
