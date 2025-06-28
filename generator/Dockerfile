FROM python:3.9-slim
WORKDIR /app
RUN pip install -r requirements.txt
COPY generator_app.py .
RUN pip install flask
CMD ["python", "app.py"]
