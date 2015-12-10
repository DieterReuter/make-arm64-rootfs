FROM ubuntu:15.10
RUN apt-get update
RUN apt-get install -y wget

RUN mkdir /data
WORKDIR /data
COPY build.sh /

RUN /build.sh
