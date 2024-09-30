FROM ubuntu:latest

COPY ./Paper /Paper
COPY ./server /server
COPY .git .git
COPY .gitmodules .gitmodules

RUN apt-get update && \
    apt-get install -y git openjdk-21-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /Paper
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"
RUN git submodule update --init --recursive
RUN git checkout master
RUN ./gradlew applyPatches --info
RUN ./gradlew createReobfBundlerJar

WORKDIR /
RUN cp /Paper/build/libs/paper-*.jar /server/paper.jar

WORKDIR /server
CMD ["sh", "-c", "java -Xms2G -Xmx2G -jar paper.jar --nogui"]
