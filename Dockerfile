FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /workspace

COPY pom.xml .
RUN mvn --batch-mode dependency:go-offline

COPY src ./src
RUN mvn --batch-mode package -DskipTests

FROM eclipse-temurin:latest AS runtime

RUN jlink \
	--add-modules java.base \
	--strip-debug \
	--no-man-pages \
	--no-header-files \
	--compress=2 \
	--output /opt/custom-jre

FROM debian:bookworm-slim

WORKDIR /app

COPY --from=runtime /opt/custom-jre /opt/custom-jre
COPY --from=build /workspace/target/copilot-ci-cd-1.0-SNAPSHOT.jar app.jar

ENTRYPOINT ["/opt/custom-jre/bin/java", "-cp", "app.jar", "com.example.app.Application"]