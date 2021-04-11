# Start with a base image containing Java runtime
FROM adoptopenjdk/openjdk11-openj9:alpine-jre

# Maintainer info
LABEL maintainer="Mohammed Amine BOUTOUIL <boutouilmohammedamine@gmail.com>"

# Set the working directory to /app
WORKDIR /app

# Make port 9080 available to the world outside this container
EXPOSE 9080

# Add the application's jar to the container
COPY target/*.jar /app/app.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/app.jar"]