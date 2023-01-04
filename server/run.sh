#!/bin/bash
git submodule update --init --recursive && ./build.sh && screen -S minecraft -dm ./start.sh 
