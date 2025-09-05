FROM apache/kafka:3.7.1

ENV KAFKA_HOME=/opt/kafka \
    KAFKA_LOG_DIR=/opt/kafka/kafka-logs \
    PATH=$KAFKA_HOME/bin:$PATH

COPY docker-entrypoint.sh /opt/kafka/entrypoint.sh
RUN chmod +x /opt/kafka/entrypoint.sh

EXPOSE 9092 9093

ENTRYPOINT ["/opt/kafka/entrypoint.sh"]

