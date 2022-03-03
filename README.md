# Basic Rack App
The purpose of this app is to serve as either a simple app which responds to a
request or as a base to build off of.

# Running The App
This app can be run with either Docker or the `rackup` command.

## Docker
Before the container can be started the image will first need to be built. To
build the image run `docker build -t basic_rack_app .`.

Note that the Docker approach is using a `startup.sh` script to start the rack
server. You may need to change permissions on this file, `chmod u+x startup.sh`
should do the trick.

Once the image is built the container can be started with the command
`docker run -p 5000:5000 basic_rack_app .`. The "-p" command maps the host port
5000 to the docker port 5000.

Finally, you can make a request against it like so `curl localhost:5000`.

### Alternative Docker Run Command
This alternative takes advantage of the [rerun](https://github.com/alexch/rerun)
gem. This gem watches for file changes and allows for development while the
Docker container is running.

To take advantage of rerun you can start the container with this command:  
`docker run -d -p 5000:5000 -v "$(pwd):/app" basic_rack_app`

The above command can be broken down like so:  
* `docker run` starts the container
* `-d` stands for detached so control returns to the terminal
* `-p 5000:5000` binds your local port 5000 to the container's port 5000
* `-v "$(pwd):/app"` mounts your `pwd` (present working directory) into the
  container via its `/app` directory. `/app` is specified in the Dockerfile
* `basic_rack_app` is the name of the image

Much like the previous directions, you can make a request against the running
container like so `curl localhost:5000`. Making a change to the `config.ru`
file, for example, and then saving it, will be reflected once you make another
`curl` request.

## Rack
Alternatively to Docker, this can be run via Rack with `rackup configu.ru`. Once
this is successful it will output what it's listening on. For example:
`Listening on tcp://localhost:9292`.

A request against this looks like `curl localhost:9292`.
