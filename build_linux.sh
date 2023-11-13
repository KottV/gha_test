#!/usr/bin/bash

cmake -B cmake-build -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build -j`nproc`

if [ $? -eq 0 ]; then
    echo "Build successful"
else
    echo "Build failed"
    exit 1
fi

if [ "$1" = "archive" ]; then
    mkdir -p archive
    tar cfz archive/binarchive.tar.gz -C cmake-build gha
fi
