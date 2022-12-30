FROM openjdk:17-oracle

RUN mkdir /mcserver

WORKDIR /mcserver

RUN mkdir Paper
RUN mkdir server 

COPY ./Paper ./Paper
COPY ./server ./server
COPY ./server/build.sh ./server
COPY ./eula.txt ./server/eula.txt

WORKDIR /mcserver/server

CMD ["./run.sh"]
