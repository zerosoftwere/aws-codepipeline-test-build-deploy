from flask import Flask, jsonify, render_template
from datetime import datetime

application = Flask(__name__)


@application.get('/api/hello')
def hello():
    return jsonify({'message': 'hello world'})

@application.get('/health')
def health():
    return jsonify({'status': 'UP'}), 201

@application.get('/')
def index():
    return render_template('index.html', date=datetime.now().isoformat(timespec='seconds'))

if __name__ == '__main__':
    application.run(debug=True, port=8000)