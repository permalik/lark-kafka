#!/bin/sh

if [ -z "$SHELLED" ]; then
    export SHELLED=1
    exec "$SHELL" "$0" "$@"
fi

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <topic> <message>"
    exit 1
else
    echo "999##$2" | kafkactl produce $1 --separator=##
fi
