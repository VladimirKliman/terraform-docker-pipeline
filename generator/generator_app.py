from flask import Flask, jsonify
import random
import datetime

app = Flask(__name__)

@app.route("/data")
def data():
    return jsonify({
        "timestamp": datetime.datetime.utcnow().isoformat(),
        "value": random.randint(0, 100)
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
