This repository is currently WIP. Some files are missing and will be updated in due course of time.

## KafkaStreams
Kafka Streams is a library enabling you to perform per-event processing of records. You can use it to process data as soon as it arrives, versus having to wait for a batch to occur. In this project, I use Kafka Streams to stream some input data as plain-text and process it in real-time. With this, I can count the number of words from our input stream.

## Instructions to run this project
I use the WordCount demo application that comes with the Kafka binaries. This application is already built, so we won't create the application from scratch. We need to create an input topic, an output topic, and then use the WordCount Streaming Application to count the number of words in the input stream using the Kafka console consumer. We do this by passing in the apprpriate properties to the console consumer to format, serialize, and deserialize the data into the correct output for viewing in the console. When we have an output of the count of each word in the console, we've successfully completed this lab.

We need to create the Kafka cluster in order to proceed with creating our first topic.

Here are the instructions for starting the Kafka cluster:

### Use Docker Compose to build the Kafka Cluster.
cd kafka_binaries
docker-compose up -d --build

### Install Java.
sudo apt install default-jdk

### Unzip the Kafka binaries tar file located in /home/cloud_user
tar -xvf kafka_2.12-2.2.0.tgz

### Change the name of the 'kakfa_2.12-2.2.0' to 'kafka'
mv kafka_2.12-2.2.0 kafka

### Perform all commands given in commands.sh from within the ~/kafka directory:
- Create a topic named streams-plaintext-input.
- Create a topic named streams-wordcount-output.
- Open the Kafka console producer and write the following messages:

  kafka streams is great
  kafka processes messages in real time
  kafka helps real information streams
- Open a Kafka console consumer to the output topic to read messages from the beginning using the default message formatter with the following properties:

  print.key=true
  print.value=true
  key.deserializer=org.apache.kafka.common.serialization.StringDeserializer
  value.deserializer=org.apache.kafka.common.serialization.LongDeserializer
- Run the org.apache.kafka.streams.examples.wordcount.WordCountDemo application using the kafka-run-class.sh command.
