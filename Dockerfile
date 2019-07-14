FROM debian:buster-slim

RUN set -eux; \
    mkdir -p /usr/share/man/man1; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	maven

COPY entrypoint /

ENTRYPOINT [ "/entrypoint" ]
