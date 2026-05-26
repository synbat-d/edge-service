FROM eclipse-temurin:17
RUN useradd spring
WORKDIR workspace
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} edge-service.jar
COPY build/agent/opentelemetry-javaagent.jar ./opentelemetry-javaagent.jar
RUN chown -R spring /workspace
USER spring
ENTRYPOINT ["java", "-jar", "edge-service.jar"]