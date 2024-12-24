FROM gradle:7.5.1-jdk11 AS build

WORKDIR /marytts

COPY . .

RUN gradle wrapper
RUN ./gradlew build

FROM openjdk:11-jre-slim

WORKDIR /marytts

COPY --from=build /marytts/ /marytts/

ENTRYPOINT ["./gradlew", "run"]
