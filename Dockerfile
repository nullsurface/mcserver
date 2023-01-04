FROM ubuntu

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y openjdk-17-jdk openjdk-17-jre
RUN apt-get install -y screen
RUN apt-get install -y git

RUN mkdir /mcserver

WORKDIR /mcserver

RUN mkdir Paper
RUN mkdir server 

COPY ./Paper ./Paper
COPY ./.git .
COPY ./.gitmodules .
COPY ./server ./server
COPY ./server/build.sh ./server
COPY ./eula.txt ./server/eula.txt

WORKDIR /mcserver/server

CMD ["./run.sh"]
