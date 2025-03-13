FROM openjdk:11

WORKDIR /app

COPY . .

RUN chmod +x ./gradlew

EXPOSE 8080

RUN ./gradlew build

ENTRYPOINT ["/bin/bash", "-c", "./gradlew appRun --no-daemon"]
