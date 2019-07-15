WARNING: THIS IS WORK IN PROGRESS


Current Issues:
  - Passwords cannot contain certain characters (\ / ' ")
  - Is hard coded to use mariadb/mysql
  - Oauth options not configured

Is based on 'debian:buster-slim'

Accepts http conntection or port 4567

Environment Variables and Default Values:
  - dbhost (pxlsdb)
  - dbport (3306)
  - dbuser (pxlsadmin)
  - dbpass (YOU MUST SET THIS YOURSELF)
  - dbname (pxls)
  - ipaddress (127.0.0.1)
  - useip (falase)

Custom Config:
  - Please make an issue for any changes to the way configuration is handled.
  - Config can be mounted to /pxls.conf and will be pulled into the app  


Example command:
  - docker run -v $(pwd):/config -p 4567:4567 -e dbhost=pxldbhost -e dbuser=pxls -e dbpass=th!515aPas6W0rD -e dbname=pxls registry.nyeprice.space/moby/docker-pxls.space
 
