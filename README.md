pxls.space in Docker

WARNING: THIS IS WORK IN PROGRESS


Current Issues:
  - Passwords cannot contain certain characters (\ / ' ")
  - Is hard coded to use mariadb/mysql
  - Oauth options not configured

Is based on 'debian:buster-slim'

Environment Variables and Default Values:
  - dbhost (pxlsdb)
  - dbport (3306)
  - dbuser (pxlsadmin)
  - dbpass (YOU MUST SET THIS YOURSELF)
  - dbname (pxls)
  - ipaddress (127.0.0.1)

Custom Config:
  - Please make an issue for any changes to the way configuration is handled.
  - Config can be mounted to /pxls.conf and will be pulled into the app  
