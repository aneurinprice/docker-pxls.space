FROM debian:bullseye-slim

LABEL maintainer="Aneurin Price adp@nyeprice.space"

COPY entrypoint /

RUN set -eux; \
  apt-get update; \
  export DEBIAN_FRONTEND=noninteractive; \
  apt-get -y install maven gnupg git curl wget sudo; \
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
    ls -l target; \
  chown pxls:pxls /Pxls -R

ENTRYPOINT /entrypoint
