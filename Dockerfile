FROM ubuntu:14.04
RUN apt-get install -y tree

COPY build.sh /
RUN mkdir /data
WORKDIR /data

RUN /build.sh
