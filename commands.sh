# Create the input topic named streams-plaintext-input.

bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic streams-plaintext-input

# Create the output topic named streams-wordcount-output.

bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic streams-wordcount-output

# Open a Kafka console producer.

bin/kafka-console-producer.sh --broker-list localhost:9092 --topic streams-plaintext-input

# Open a Kafka console consumer using the default message formatter and the three defined properties given in README.

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
--topic streams-wordcount-output \
--from-beginning \
--formatter kafka.tools.DefaultMessageFormatter \
--property print.key=true \
--property print.value=true \
--property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
--property value.deserializer=org.apache.kafka.common.serialization.LongDeserializer

# Use the kafka-run-class.sh command to run the WordCountDemo application
bin/kafka-run-class.sh org.apache.kafka.streams.examples.wordcount.WordCountDemo
