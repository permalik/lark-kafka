#!/bin/sh
set -e

mkdir -p "$KAFKA_LOG_DIR"
chown -R appuser:appuser "$KAFKA_LOG_DIR"

if [ ! -f "$KAFKA_LOG_DIR/meta.properties" ]; then
    echo "Formatting Kafka storage..."
    CLUSTER_ID=$($KAFKA_HOME/bin/kafka-storage.sh random-uuid)
    $KAFKA_HOME/bin/kafka-storage.sh format -t "$CLUSTER_ID" -c "$KAFKA_HOME/config/kraft/server.properties"
fi

exec "$KAFKA_HOME/bin/kafka-server-start.sh" "$KAFKA_HOME/config/kraft/server.properties"

