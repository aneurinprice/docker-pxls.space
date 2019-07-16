FROM debian:buster-slim

RUN set -eux; \
    mkdir -p /usr/share/man/man1; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	maven; \
	git clone https://github.com/pxlsspace/Pxls.git; \
	cd Pxls; \
	pwd; \
	mvn clean package

ENV dbhost="pxls-mysql"
ENV dbport="3306"
ENV dbuser="pxls"
ENV dbpass="YOU MUST SET THIS YOURSELF"
ENV dbname="pxls"
ENV ipaddress="127.0.0.1"
ENV useip="false"
ENV callbackBase="false"
ENV redditkey="false"
ENV redditsecret="false"
ENV googlekey="false"
ENV googlesecret="false"
ENV discordkey="false"
ENV discordsecret="false"
ENV vkkey="false"
ENV vksecret="false"
ENV tumblrkey="false"
ENV tumblrsecret="false"


COPY entrypoint /
COPY resources/reference.conf /pxls.conf

CMD [ "/bin/bash", "-c", "/entrypoint" ]
