FROM maven:latest as pxls-build

LABEL maintainer="Aneurin Price adp@nyeprice.space"
COPY Pxls/ /pxls

RUN set -eux; \
	cd /pxls;\
	mvn clean package



FROM alpine:3.12.0
LABEL maintainer="Aneurin Price adp@nyeprice.space"
RUN set -eux; \
	apk add --no-cache\
		bash\
		curl\
		openjdk14 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing;\
	addgroup \
		pxls; \
	adduser \
    		--disabled-password \
    		--gecos "" \
    		--home /home/pxls \
    		--ingroup pxls \
    		--uid 6969 \
    		pxls
USER pxls
WORKDIR /home/pxls
COPY --chown=pxls --from=pxls-build /pxls ./
COPY entrypoint.d/ /entrypoint.d
COPY ci/ ci/
HEALTHCHECK CMD curl --fail http://localhost:4567/||exit 1
ENTRYPOINT [ "/bin/run-parts", "--exit-on-error", "/entrypoint.d" ]
