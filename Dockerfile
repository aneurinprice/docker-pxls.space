FROM debian:buster-slim

ARG dbhost="pxlsdb"
ARG dbport="3306"
ARG dbuser="pxlsadmin"
ARG dbpass="YOU MUST SET THIS"
ARG dbname="pxls"

ENV dbhost="$dbhost"
ENV dbport="$dbport"
ENV dbuser="$dbuser"
ENV dbpass="$dbpass"
ENV dbname="$dbname"

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

COPY entrypoint /

ENTRYPOINT [ "/entrypoint" ]
