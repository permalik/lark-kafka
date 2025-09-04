FROM apache/kafka:3.7.1

ENV KAFKA_HOME=/opt/kafka
ENV KAFKA_LOG_DIR=/opt/kafka/kafka-logs
ENV PATH=$KAFKA_HOME/bin:$PATH

USER root
RUN mkdir -p $KAFKA_HOME \
    && mkdir -p $KAFKA_LOG_DIR \
    && chown -R kafka:kafka $KAFKA_HOME \
    && chown -R kafka:kafka $KAFKA_LOG_DIR

USER kafka

EXPOSE 9092 9093

CMD ["sh", "-c", "$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties"]

