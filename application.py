from flask import Flask, jsonify

application = Flask(__name__)


@application.get('/hello')
def hello():
    return jsonify({'message': 'hello world'})

if __name__ == '__main__':
    application.run(debug=True)