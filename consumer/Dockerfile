FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY consumer_app.py .
RUN pip install requests
CMD ["python", "consumer_app.py"]
