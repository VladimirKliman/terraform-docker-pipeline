FROM python:3.9-slim
WORKDIR /app
RUN pip install -r requirements.txt
COPY consumer_app.py .
RUN pip install requests
CMD ["python", "app.py"]
