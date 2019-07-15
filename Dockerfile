FROM debian:buster-slim

ENV dbhost="pxlsdb"
ENV dbport="3306"
ENV dbuser="pxlsadmin"
ENV dbpass="YOU MUST SET THIS"
ENV dbname="pxls"

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
COPY resources/reference.conf /pxls.conf

CMD [ "/bin/bash", "-c", "/entrypoint" ]
