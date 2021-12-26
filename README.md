# Basic Rack App
The purpose of this app is to serve as either a simple app which responds to a
request or as a base to build off of.

# Running The App
This app can be run with either Docker or the `rackup` command.

## Docker
Before the container can be started the image will first need to be built. To
build the image run `docker build -t basic_rack_app .`.

Once the image is built the container can be started with the command
`docker run -p 5000:5000 basic_rack_app .`. The "-p" command maps the host port
5000 to the docker port 5000.

Finally, you can make a request against it like so `curl localhost:5000`.

## Rack
Alternatively to Docker, this can be run via Rack with `rackup configu.ru`. Once
this is successful it will output what it's listening on. For example:
`Listening on tcp://localhost:9292`.

A request against this looks like `curl localhost:9292`.
