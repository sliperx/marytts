FROM gradle:7.6.4-jdk17-alpine AS builder
WORKDIR /app
COPY . /app

RUN /app/gradlew build --no-daemon --refresh-dependencies --stacktrace

FROM openjdk:19-jdk
RUN microdnf install -y findutils && microdnf clean all
WORKDIR /app
COPY --from=builder /app/ /app/
EXPOSE 5920
ENTRYPOINT ["./gradlew", "run"]
