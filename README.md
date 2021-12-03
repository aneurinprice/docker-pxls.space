# DOCKER-PXLS.SPACE

This is a docker container for running [pxls.space](https://github.com/pxlsspace/Pxls). You must provide your own database and config file.

## Example Config
### Config
```
database {
  url: "jdbc:postgresql://localhost:3306/pxls"
  user: "AzureDiamond"
  pass: "hunter2"
}
```
This config file must be mounted to `/pxls.conf`

### Roles (Optional)
```
roleID {
  name: Role Name
  type: GUEST | USER | STAFF
  default: true | false
  inherits: [ roleID, ... ]
  badges: [
    {
      name: Badge Name
      tooltip: Badge Tooltip
      type: text | icon
      cssIcon: fas fa-icon-name
    }
  ]
  permissions: [
    permission.node
  ]
}
```
This roles config should be mounted to `/roles.conf`



## How to run

```
docker run -p 4567:4567 -v $(pwd)/config:/pxls.conf m08y/docker-pxls.space
```

## Gotchas

- Updated daily, any bugs are likely from upstream changes to the pxls.space codebase
- You must provice your own database and configmap


[Dockerhub](https://hub.docker.com/r/m08y/docker-pxls.space)

[Github](https://github.com/aneurinprice/docker-pxls.space/)
