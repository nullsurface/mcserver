#!/bin/bash
cd ./Paper/

./gradlew applyPatches
./gradlew createReobfBundlerJar
