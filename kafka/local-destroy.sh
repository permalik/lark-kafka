#!/bin/sh

if [ -z "$SHELLED" ]; then
    export SHELLED=1
    exec "$SHELL" "$0" "$@"
fi

/Users/tymalik/kafka/bin/kafka-server-stop.sh
rm -rf /Users/tymalik/Docs/Git/lark/lark-bp/kafka/logs
rm -rf /tmp/kraft-combined-logs
