#!/bin/sh

if [ -z "$SHELLED" ]; then
    export SHELLED=1
    exec "$SHELL" "$0" "$@"
fi

nohup /Users/tymalik/kafka/bin/kafka-server-start.sh /Users/tymalik/kafka/config/kraft/server.properties > /dev/null 2>&1 &
