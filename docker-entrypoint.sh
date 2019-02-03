#!/bin/bash

function finish {
    echo "im done here"
}

trap finish EXIT

chown -R rocksdb:rocksdb /var/opt/rocks/mysql

echo "$(date +%H:%M:%S) Finished initial startup"

exec "$@"
