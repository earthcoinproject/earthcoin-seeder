# compiles and runs earthcoin-seeder
#
# build the container:
#   docker build -t linki/earthcoin-seeder .
#
# run the dns node:
#   docker run -d -p 53:53/tcp -p 53:53/udp linki/earthcoin-seeder
#
# if you want to poke around in the container:
#   docker run -ti --rm --entrypoint /bin/sh linki/earthcoin-seeder -c /bin/sh
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

FROM alpine:3.3
MAINTAINER Linki <linki+docker.com@posteo.de>

RUN mkdir -p /app/bin /app/src /var/lib/earthcoin-seeder

RUN apk --no-cache add    \
      boost-dev           \
      gcc                 \
      git                 \
      g++                 \
      libc-dev            \
      make                \
      openssl-dev

WORKDIR /app/src

RUN git clone --depth 1 https://github.com/earthcoinproject/earthcoin-seeder.git /app/src && \
    make

RUN mv /app/src/dnsseed /app/bin/dnsseed

WORKDIR /var/lib/earthcoin-seeder

EXPOSE 53

ENTRYPOINT ["/app/bin/dnsseed"]

CMD ["-h", "dnsseed.earthcointools.org", \
     "-n", "seed.earthcointools.org", \
     "-m", "dnsadmin.earthcointools.org", \
     "-p", "53"]
