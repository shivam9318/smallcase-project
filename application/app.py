from flask import Flask, jsonify
import random

app = Flask(__name__)

options = ["Investments", "Smallcase", "Stocks", "buy-the-dip", "TickerTape"]

@app.route('/api/v1', methods=['GET'])
def get_random_word():
    return jsonify(random.choice(options))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081)

