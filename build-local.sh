#!/bin/bash -e

docker build -t builder .
docker run --rm -v $(pwd):/out builder cp rootfs.tar.gz /out/
ls -al rootfs.tar.gz
