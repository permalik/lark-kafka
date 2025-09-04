FROM apache/kafka:3.7.1

ENV KAFKA_HOME=/opt/kafka \
    KAFKA_LOG_DIR=/opt/kafka/kafka-logs \
    PATH=$KAFKA_HOME/bin:$PATH

RUN groupadd -r kafka && \
    useradd -r -g kafka -d $KAFKA_HOME -s /sbin/nologin kafka

RUN mkdir -p $KAFKA_HOME $KAFKA_LOG_DIR && \
    chown -R kafka:kafka $KAFKA_HOME $KAFKA_LOG_DIR

USER kafka

EXPOSE 9092 9093

ENTRYPOINT ["sh", "-c", "exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/kraft/server.properties"]

