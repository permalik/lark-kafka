#!/bin/sh

if [ -z "$SHELLED" ]; then
    export SHELLED=1
    exec "$SHELL" "$0" "$@"
fi

KAFKA_CLUSTER_ID="$(/Users/tymalik/kafka/bin/kafka-storage.sh random-uuid)"
/Users/tymalik/kafka/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c /Users/tymalik/kafka/config/kraft/server.properties
