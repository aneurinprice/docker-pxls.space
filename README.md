# DOCKER-PXLS.SPACE

[Dockerhub](https://hub.docker.com/r/m08y/docker-pxls.space)

[Github](https://github.com/aneurinprice/docker-pxls.space/)

This is a docker container for running [pxls.space](https://github.com/pxlsspace/Pxls)

```
version: "3.9"
services:
  pxls-frontend:
    image: m08y/docker-pxls-space:develop
    restart: always
    ports:
      - "4567:4567"
    environment:
      DATABASE_USER: "pxls"
      DATABASE_PASSWORD: "ChAnGeMeAtYoUrEaRlIeStCoNvEnIeNcE"
      DATABASE_NAME: "pxls"
      DATABASE_HOST: "pxls-database"
      PXLS_HOST: "localhost"
    volumes:
      - pxls-datastore:/data
  
  pxls-database:
    image: postgres
    restart: always
    environment:
      POSTGRES_USER: "pxls"
      POSTGRES_PASSWORD: "ChAnGeMeAtYoUrEaRlIeStCoNvEnIeNcE"
      POSTGRES_DB: "pxls"
    volumes:
      - pxls-database:/var/lib/postgresql

volumes:
  pxls-database: {}
  pxls-datastore: {}
```



## How to run

```
docker-compose up
```

## Gotchas

- Updated daily, any bugs are likely from upstream changes to the pxls.space codebase
- Config will be stored in a docker volume
- Container will generate config for database connection and such if they are not detected


## Running without Docker Compose
- Check the environmental variables from the compose file for reference
- Make sure the credentials are the same
- Persist /data if you care about it
