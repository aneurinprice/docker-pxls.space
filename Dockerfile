FROM debian:buster-slim

LABEL maintainer="Aneurin Price adp@nyeprice.space"

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

ENV canvascode="1"
ENV pagetitle="Pxls"
ENV ipaddress="127.0.0.1"
ENV host="localhost"
ENV dbhost="pxls-mysql"
ENV dbport="3306"
ENV dbuser="pxls"
ENV dbpass="YOU MUST SET THIS YOURSELF"
ENV dbname="pxls"
ENV authuseip="false"
ENV authcallbackbase="http://localhost:4567/auth"
ENV authredditkey=""
ENV authredditsecret=""
ENV authgooglekey=""
ENV authgooglesecret=""
ENV authdiscordkey=""
ENV authdiscordsecret=""
ENV authvkkey=""
ENV authvksecret=""
ENV authtumblrkey=""
ENV authtumblrsecret=""


COPY entrypoint /
COPY resources/reference.conf /pxls.conf

CMD [ "/bin/bash", "-c", "/entrypoint" ]
