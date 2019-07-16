WARNING: THIS IS WORK IN PROGRESS

Available on Dockerhub: https://hub.docker.com/r/m08y/docker-pxls.space

Current Issues:
  - Passwords cannot contain certain characters (\ / ' ")
  - Is hard coded to use mariadb/mysql
  - Oauth options not configured

Is based on 'debian:buster-slim'

Accepts http conntection or port 4567

Environment Variables and Default Values:

Database Options:
  - dbhost 		(pxls-mysql)
  - dbport 		(3306)
  - dbuser 		(pxls)
  - dbpass 		(YOU MUST SET THIS YOURSELF)
  - dbname 		(pxls)

Auth Options:
  - useip 		(false)
  - reddit-key 		(null)
  - reddit-secret 	(null)
  - google-key 		(null)
  - google-secret 	(null)  
  - discord-key 	(null)
  - discord-secret	(null)
  - vk-key		(null)
  - vk-secret		(null)
  - tumblr-key		(null)
  - tumblr-secret	(null)

MISC Options:
  - ipaddress 		(127.0.0.1)

Custom Config:
  - Please make an issue for any changes to the way configuration is handled.
  - Config can be mounted to /pxls.conf and will be pulled into the app  


Example command:
  - docker run -v $(pwd):/config -p 4567:4567 -e dbhost=pxldbhost -e dbuser=pxls -e dbpass=th!515aPas6W0rD -e dbname=pxls registry.nyeprice.space/moby/docker-pxls.space
 
