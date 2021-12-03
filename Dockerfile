FROM adoptopenjdk/openjdk14:latest as pxls-build

LABEL maintainer="Aneurin Price adp@nyeprice.space"

RUN set -eux; \
  export DEBIAN_FRONTEND=noninteractive; \
  apt-get update; \
  apt-get -y install maven git curl; \
  git clone https://github.com/pxlsspace/Pxls.git; \
  cd Pxls/; \
  mvn clean package; \
  addgroup \
    pxls; \
  adduser \
    --disabled-password \
    --gecos "" \
    --home /Pxls \
    --ingroup pxls \
    --uid 6969 \
    pxls; \
    ls -l target; \
  chown pxls:pxls /Pxls -R
USER pxls
WORKDIR /Pxls
COPY entrypoint.d/ /entrypoint.d
HEALTHCHECK CMD curl --fail http://localhost:4567/||exit 1
ENTRYPOINT [ "/bin/run-parts", "--exit-on-error", "/entrypoint.d" ]
