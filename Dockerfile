FROM openjdk:11

WORKDIR /app

COPY . .

RUN chmod +x ./gradlew

RUN apt-get update && apt-get install -y bash curl unzip python3 python3-pip

RUN curl -sSL https://chromedriver.storage.googleapis.com/113.0.5672.63/chromedriver_linux64.zip -o chromedriver.zip \
     && unzip chromedriver.zip \
     && mv chromedriver /usr/local/bin/ \
     && rm chromedriver.zip

RUN pip3 install --upgrade pip \
    && pip3 install pipenv \
    && pipenv install

EXPOSE 8080

RUN ./gradlew build

ENTRYPOINT ["/bin/bash", "-c", "./gradlew appRun --no-daemon"]
