# WORK IN PROGRESS BUT PRETTY MUCH STABLE #

## Auto-Mirrored from Gitlab -> Github ->  My Registry ##

## Please make Pull/Merge Requests on my Gitlab, Issues can be raised anywhere ##

### Available on my [Gitlab](https://gitlab.nyeprice.space/moby/docker-pxls-space) ###

### Available on [Github](https://github.com/aneurinprice/docker-pxls.space) ###

### Available on [My Registry](https://registry.nyeprice.space) ###
### Available on [Dockerhub](https://hub.docker.com/r/m08y/docker-pxls.space)


## Current Issues: ##

Is based on _alpine:3.12.0_

Accepts http conntections on port 4567

## Config: ##
  - Config should be mounted to /pxls.conf and /roles.conf. This will be pulled into the app  


## Example command: ##
  - `docker run -p 4567:4567 registry.nyeprice.space/docker-pxls.space/docker-pxls.space:latest`
 
