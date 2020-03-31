## Building a container

```
deployment/docker/docker_image_build.sh
```


## Testing a container

```
cd deployment/docker
./docker_container_run.sh --image govready/govready-q:v0.9.0.2.1-mesosphere-2-g96fb56f
```

## Testing a container environmental variables

```
# set environment variables
GR_HOST=myorg.localhost
export GR_HOST
GR_PORT=8008
export GR_PORT

# run docker container
./docker_container_run.sh --image govready/govready-q:v0.9.0.2.1-mesosphere-2-g96fb56f --address myorg.localhost:8008
```

I expect to be able connect in browser to myorg.localhost:8008


## Publishing a container


docker image push govready/govready-q:v0.9.0.2.1-mesosphere-2-g96fb56f
docker image tag govready/govready-q:v0.9.0.2.1-mesosphere-2-g96fb56f govready/govready-q:latest && docker image push govready/govready-q:latest



To autobuild a branch on hub.docker.com

