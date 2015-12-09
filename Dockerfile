FROM ubuntu:15.10
RUN apt-get update && \
    apt-get install -y tree

COPY build.sh /
RUN mkdir /data
WORKDIR /data

RUN /build.sh
