import os
import time
from kafka import KafkaProducer

bootstrap_servers = os.getenv('BOOTSTRAP_SERVERS', 'kafka:9092')

producer = KafkaProducer(bootstrap_servers=bootstrap_servers)

topic = 'test-topic'

print(f"Sending messages to Kafka on {bootstrap_servers} topic {topic}")

try:
    while True:
        message = b"Hello from Kafka Producer!"
        producer.send(topic, message)
        print(f"Sent: {message}")
        time.sleep(5)
except KeyboardInterrupt:
    print("Producer stopped")
finally:
    producer.close()
