FROM maven:3.8.3-openjdk-16 AS build

RUN java -version
RUN git clone https://github.com/pxlsspace/Pxls.git;
RUN cd Pxls; \
mvn clean package; \
mkdir /tmp/pxls; \
cp target/pxls*.jar /tmp/pxls/pxls.jar; \
cp -r resources/* /tmp/pxls

FROM adoptopenjdk/openjdk16
LABEL maintainer="Aneurin Price adp@nyeprice.space"
COPY --from=build /tmp/pxls /tmp/
COPY entrypoint.d/ /entrypoint.d
HEALTHCHECK CMD curl --fail http://localhost:4567/ || exit 1
ENTRYPOINT [ "/bin/run-parts", "--exit-on-error", "/entrypoint.d" ]
