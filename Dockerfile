FROM apache/kafka:3.7.1

ENV KAFKA_HOME=/opt/kafka \
    KAFKA_LOG_DIR=/opt/kafka/kafka-logs \
    PATH=$KAFKA_HOME/bin:$PATH

RUN mkdir -p $KAFKA_HOME $KAFKA_LOG_DIR

RUN CLUSTER_ID=$($KAFKA_HOME/bin/kafka-storage.sh random-uuid) && \
    $KAFKA_HOME/bin/kafka-storage.sh format -t $CLUSTER_ID -c $KAFKA_HOME/config/kraft/server.properties

EXPOSE 9092 9093

ENTRYPOINT ["sh", "-c", "exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/kraft/server.properties"]

