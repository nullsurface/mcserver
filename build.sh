#!/bin/bash
cd ./Paper/

./gradlew applyPatches
./gradlew createReobfBundlerJar

cp ./build/libs/paper-bundler-1.19.3-R0.1-SNAPSHOT-reobf.jar ../server/paper.jar
