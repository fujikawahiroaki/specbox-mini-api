#!/bin/bash

set -euo pipefail

warnfail () {
  echo "$@" >&2
  exit 1
}

case ${1:-} in
  "")
    ;;

  *)
    exec "$@"
esac

if ! [ -d bin ] ; then
  echo 'Creating bin directory'
  mkdir bin
fi
if ! shards check ; then
  echo 'Installing shards...'
  shards install
fi

echo 'Waiting for postgres to be available...'
./docker/wait-for-it.sh -q postgres:5432

echo 'Starting server...'
exec crystal run src/specbox-mini-api.cr
