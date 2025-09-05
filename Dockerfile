FROM apache/kafka:3.7.1

ENV KAFKA_HOME=/opt/kafka \
    KAFKA_LOG_DIR=/opt/kafka/kafka-logs \
    PATH=$KAFKA_HOME/bin:$PATH

COPY entrypoint.sh /opt/kafka/entrypoint.sh
RUN chmod +x /opt/kafka/entrypoint.sh

RUN mkdir -p $KAFKA_LOG_DIR && chown -R appuser:appuser $KAFKA_LOG_DIR

EXPOSE 9092 9093

USER appuser

ENTRYPOINT ["/opt/kafka/entrypoint.sh"]

