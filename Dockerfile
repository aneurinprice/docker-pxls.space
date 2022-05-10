#FROM debian:bullseye-slim AS build
FROM adoptopenjdk/openjdk16:alpine AS build

#RUN set -eux; \
#  apt-get update; \
#  export DEBIAN_FRONTEND=noninteractive; \
#  apt-get -y install maven git curl ; \
#  curl  -O https://download.java.net/java/GA/jdk16.0.2/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-16.0.2_linux-x64_bin.tar.gz; \
#  tar -xvf openjdk-16.0.2_linux-x64_bin.tar.gz; \
#  mv jdk-16.0.2 /opt/; \
#  export JAVA_HOME=/opt/jdk-16.0.2; \
#  export PATH=$PATH:$JAVA_HOME/bin; \
#  java -version; \
#  git clone https://github.com/pxlsspace/Pxls.git; \
#  cd Pxls/; \
#  mvn clean package; \
#  cp /Pxls/target/pxls*.jar /tmp/pxls.jar
RUN apk add --no-cache \
	maven\
	git; \
    git clone https://github.com/pxlsspace/Pxls.git; \
    cd Pxls/; \
    mvn clean package; \
    cp /Pxls/target/pxls*.jar /tmp/pxls.jar
   


FROM adoptopenjdk/openjdk16:alpine
LABEL maintainer="Aneurin Price adp@nyeprice.space"
COPY --from=build /tmp/pxls.jar /tmp/pxls.jar
COPY entrypoint.d/ /entrypoint.d
HEALTHCHECK CMD curl --fail http://localhost:4567/ || exit 1
ENTRYPOINT [ "/bin/run-parts", "--exit-on-error", "/entrypoint.d" ]
