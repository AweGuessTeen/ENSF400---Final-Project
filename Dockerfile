FROM openjdk:11

WORKDIR /app

COPY . .

RUN chmod +x ./gradlew

RUN pip3 install --upgrade pip \
    && pip3 install pipenv \
    && pipenv install

EXPOSE 8080

RUN ./gradlew build

ENTRYPOINT ["/bin/bash", "-c", "./gradlew appRun --no-daemon"]
