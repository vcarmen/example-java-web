FROM openjdk:11-jre-slim
EXPOSE 8080
WORKDIR /app
COPY ./build/libs/*.jar /app/serving-web-content-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "serving-web-content-0.0.1-SNAPSHOT.jar"]

