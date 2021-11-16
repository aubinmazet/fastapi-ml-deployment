def pytest_addoption(parser):
    parser.addoption("--ip_api", action="store", default="localhost")
    parser.addoption("--port_api", action="store", default="5000")
