FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8-slim
WORKDIR /app
COPY src/requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt
COPY /src /src
WORKDIR /src
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5000"]