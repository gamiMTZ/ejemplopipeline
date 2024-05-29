# Use a base image with Java installed
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the compiled Java class to the container
COPY Programa.class ./

# Specify the default command to run your Java program
CMD ["java", "Programa"]
