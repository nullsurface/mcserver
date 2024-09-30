FROM openjdk:17-oracle

COPY ./Paper /Paper
COPY ./server /server

WORKDIR /Paper
RUN git submodule update --init --recursive
RUN git checkout master
RUN ./gradlew applyPatches
RUN ./gradlew createReobfBundlerJar

WORKDIR /
cp /Paper/build/libs/paper-*.jar /server/paper.jar

WORKDIR /server
CMD ["java -Xms2G -Xmx2G -jar ./paper.jar --nogui"]
