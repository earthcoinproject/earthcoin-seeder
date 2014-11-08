# compiles and runs earthcoin-seeder
#
# build the container:
#   docker build -t linki/earthcoin-seeder .
#
# run the dns node:
#   docker run -d -p 53:53/tcp -p 53:53/udp linki/earthcoin-seeder
#
# if you want to poke around in the container:
#   docker run -ti --rm linki/earthcoin-seeder /bin/bash
#
# and don't forget on the host:
#
#   ufw allow 53
#
# related resources:
#
#   https://github.com/sipa/bitcoin-seeder/blob/master/README
#   https://help.ubuntu.com/community/UFW
#   http://docs.docker.io/installation/ubuntulinux/#docker-and-ufw

FROM phusion/baseimage:0.9.15
MAINTAINER Linki <linki+docker.com@posteo.de>

RUN apt-get update && \
    apt-get install -y build-essential git-core libboost-dev libssl-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/earthcoinproject/earthcoin-seeder.git /usr/src/earthcoin-seeder

WORKDIR /usr/src/earthcoin-seeder

RUN make

ADD earthcoin-seeder.sh /etc/service/earthcoin-seeder/run

EXPOSE 53
