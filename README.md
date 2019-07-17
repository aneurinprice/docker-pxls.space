WORK IN PROGRESS BUT PRETTY MUCH STABLE

Available on Dockerhub: https://hub.docker.com/r/m08y/docker-pxls.space

Current Issues:
  - Passwords and strings MUST be consloed in single quotes 'dsfhl$f'.
  - Certain characters not working in strings, \t is the only known instance.
  - Is hard coded to use mariadb/mysql - Will fix later although mariadb/mysql is reccomended.

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
  - callbackBase 	(false)
  - reddit-key 		(false)
  - reddit-secret 	(false)
  - google-key 		(false)
  - google-secret 	(false)  
  - discord-key 	(false)
  - discord-secret	(false)
  - vk-key		(false)
  - vk-secret		(false)
  - tumblr-key		(false)
  - tumblr-secret	(false)

MISC Options:
  - ipaddress 		(127.0.0.1)

Custom Config:
  - Please make an issue for any changes to the way configuration is handled.
  - Config can be mounted to /pxls.conf and will be pulled into the app  


Example command:
  - docker run -v $(pwd):/config -p 4567:4567 -e dbhost=pxldbhost -e dbuser=pxls -e dbpass=th!515aPas6W0rD -e dbname=pxls registry.nyeprice.space/moby/docker-pxls.space
 
