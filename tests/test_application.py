import pytest
from application import application
from flask.testing import FlaskClient

@pytest.fixture()
def client():
    client = application.test_client()
    yield client

def test_hello(client: FlaskClient):
    resposne = client.get('/hello')
    assert resposne.status_code == 200