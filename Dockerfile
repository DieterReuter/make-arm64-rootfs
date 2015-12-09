FROM ubuntu:15.10
RUN apt-get update
RUN apt-get install -y wget

COPY build.sh /
RUN mkdir /data
WORKDIR /data

RUN /build.sh
