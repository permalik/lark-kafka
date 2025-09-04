#!/bin/sh

if [ -z "$SHELLED" ]; then
    export SHELLED=1
    exec "$SHELL" "$0" "$@"
fi

if [ -z "$1" ]; then
    echo "Provide topic"
    exit 1
else
    kafkactl consume $1 --from-beginning --print-keys -o yaml
fi
