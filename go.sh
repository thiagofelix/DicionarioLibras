#!/bin/bash

function main {
  DIR=/tmp/$(cat /dev/urandom | env LC_CTYPE=C tr -cd 'a-f0-9' | head -c 32)

  mkdir -p $DIR
  cd $DIR
  curl -k -L https://github.com/thiagofelix/DicionarioLibras/tarball/master | tar zx --strip-components=1
  make install
}

main
