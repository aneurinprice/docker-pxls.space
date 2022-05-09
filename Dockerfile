FROM debian:bullseye-slim

LABEL maintainer="Aneurin Price adp@nyeprice.space"

RUN set -eux; \
  apt-get update; \
  export DEBIAN_FRONTEND=noninteractive; \
  apt-get -y install maven git curl ; \
  curl  -O https://download.java.net/java/GA/jdk16.0.2/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-16.0.2_linux-x64_bin.tar.gz; \
  tar -xvf openjdk-16.0.2_linux-x64_bin.tar.gz; \
  mv jdk-16.0.2 /opt/; \
  export JAVA_HOME=/opt/jdk-16.0.2; \
  export PATH=$PATH:$JAVA_HOME/bin; \
  java -version; \
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
  chown pxls:pxls /Pxls -R

WORKDIR /Pxls
COPY entrypoint.d/ /entrypoint.d
COPY src/ /src
HEALTHCHECK CMD curl --fail http://localhost:4567/||exit 1
ENTRYPOINT [ "/bin/run-parts", "--exit-on-error", "/entrypoint.d" ]
