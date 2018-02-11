FROM maven:3-jdk-8
ADD . /src
RUN cd /src && mvn package

FROM openjdk:8-jre-slim
COPY --from=0 /src/target/json-hive-schema-1.0-jar-with-dependencies.jar  /
ENTRYPOINT [ "java", "-jar", "/json-hive-schema-1.0-jar-with-dependencies.jar"]


