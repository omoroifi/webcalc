from flask import Flask, request, jsonify
from functools import reduce
import operator
app = Flask(__name__)


@app.route('/add', methods=['GET'])
def add():
    return jsonify(sum(request.json))


@app.route('/sub', methods=['GET'])
def substract():
    return jsonify(reduce(operator.sub, request.json[1:], request.json[0]))


@app.route('/mul', methods=['GET'])
def multiply():
    return jsonify(reduce(operator.mul, request.json, 1))


@app.route('/div', methods=['GET'])
def divide():
    return jsonify(
        reduce(operator.floordiv, request.json[1:], request.json[0]))


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
