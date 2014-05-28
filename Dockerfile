# compiles and runs earthcoin-seeder
#
# USAGE
#
# docker build -t earthcoin-seeder .
# docker run -d -p 53:53/tcp -p 53:53/udp --name evil_wozniak earthcoin-seeder
# docker logs evil_wozniak
# docker attach --sig-proxy=false evil_wozniak
#
# ufw allow 53
#
# additional resources to get started
# - https://github.com/sipa/bitcoin-seeder/blob/master/README
# - https://help.ubuntu.com/community/UFW
# - http://docs.docker.io/installation/ubuntulinux/#docker-and-ufw

FROM ubuntu:12.10
MAINTAINER linki

RUN apt-get update
RUN apt-get -y upgrade

# Upstart and DBus have issues inside docker. We work around that.
RUN dpkg-divert --local --rename --add /sbin/initctl

RUN apt-get install -y build-essential git-core libboost-dev libssl-dev

RUN git clone https://github.com/earthcoinproject/earthcoin-seeder.git /var/earthcoin-seeder

WORKDIR /var/earthcoin-seeder
RUN make

EXPOSE 53

# modify the parameters to match your needs
# see: https://github.com/earthcoinproject/earthcoin-seeder/blob/master/README
CMD ./dnsseed -h dnsseed.earthcointools.org -n seed.earthcointools.org
