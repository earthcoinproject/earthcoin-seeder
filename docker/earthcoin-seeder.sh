#!/bin/sh

# see: https://github.com/earthcoinproject/earthcoin-seeder/blob/master/README
exec /sbin/setuser root \
  /usr/src/earthcoin-seeder/dnsseed -h dnsseed.earthcointools.org -n seed.earthcointools.org >>/var/log/earthcoind-seeder.log 2>&1
