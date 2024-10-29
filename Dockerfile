# Use an OpenJDK base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Copy the Java source file to the container
COPY HelloWorld.java /app

# Compile the Java file
RUN javac HelloWorld.java

# Define the entry point for the container
CMD ["java", "HelloWorld"]
