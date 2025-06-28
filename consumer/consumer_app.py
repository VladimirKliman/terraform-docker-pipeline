import requests
import time

URL = "http://generator:5000/data"

while True:
    try:
        response = requests.get(URL)
        print("Received:", response.json())
    except Exception as e:
        print("Error:", e)
    time.sleep(5)
