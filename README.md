# WORK IN PROGRESS BUT PRETTY MUCH STABLE #

## Auto-Mirrored from Gitlab -> Github ->  Dockerhub ##

## Please make Pull/Merge Requests on my Gitlab, Issues can be raised anywhere ##

### Available on my [Gitlab](https://gitlab.nyeprice.space/moby/docker-pxls-space) ###

### Available on [Github](https://github.com/aneurinprice/docker-pxls.space) ###

### Available on [Dockerhub](https://hub.docker.com/r/m08y/docker-pxls.space) ###


## Current Issues: ##
  - Passwords and strings _MUST_ be consoled in single quotes 'dsfhl$f'.
  - Certain characters not working in strings, \t is the only known instance.

Is based on _debian:buster-slim_

Accepts http conntections on port 4567

Environment Variables and Default Values:

Variable	  |	Default Value
------------------|------------------
canvascode        | 1
pagetitle         | Pxls
ipaddress         | 127.0.0.1
host              | localhost
dbhost            | pxls-postgres
dbport            | 3306
dbuser            | pxls
dbpass            | YOU MUST SET THIS YOURSELF
dbname            | pxls
authuseip         | false
authcallbackbase  | http://localhost:4567/auth
authredditkey     | 
authredditsecret  | 
authgooglekey     | 
authgooglesecret  | 
authdiscordkey    | 
authdiscordsecret | 
authvkkey         | 
authvksecret      | 
authtumblrkey     | 
authtumblrsecret  | 

## Custom Config: ##
  - Please make an issue for any changes to the way configuration is handled.
  - Config can be mounted to /pxls.conf and will be pulled into the app  


## Example command: ##
  - `docker run -p 4567:4567 -e dbhost=pxls-postgres -e dbuser=pxls -e dbpass='an3x@mpl3' -e dbname=pxls -e authuseip='true' m08y/docker-pxls.space`

You can optionally add `-i` before the image name to keep STDIN open and run commands:
  - `docker run -p 4567:4567 -e dbhost=pxls-postgres -e dbuser=pxls -e dbpass='an3x@mpl3' -e dbname=pxls -e authuseip='true' -i m08y/docker-pxls.space`
  - (wait for instance to start, then create an account)
  - `role (your_username) admin`
