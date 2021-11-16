
import pytest
import requests


@pytest.fixture()
def ip_api(pytestconfig):
    return pytestconfig.getoption("ip_api")

@pytest.fixture()
def port_api(pytestconfig):
    return pytestconfig.getoption("port_api")


def test_api(ip_api: str, port_api: str):
    filepath = "tests/files/picture.jpg"
    response = requests.post(
        f"http://{ip_api}:{port_api}/predict", files={"file": ("filename", open(filepath, "rb"), "image/jpeg")}
    )
    assert response.status_code == 200
