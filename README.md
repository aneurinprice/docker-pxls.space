# DOCKER-PXLS.SPACE

[Dockerhub](https://hub.docker.com/r/m08y/docker-pxls.space)

[Github](https://github.com/aneurinprice/docker-pxls.space/)

This is a docker container for running [pxls.space](https://github.com/pxlsspace/Pxls)


## How to run

```
docker-compose up
```

## Gotchas

- Config will be stored in a docker volume
- Container will generate config for database connection and such if they are not detected


## Running without Docker Compose
- Image Name: `m08y/docker-pxls.space`
- Check the environmental variables from the compose file for reference
- Make sure the credentials are the same
- Persist /data if you care about it
