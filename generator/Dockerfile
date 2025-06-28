FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY generator_app.py .
RUN pip install flask
CMD ["python", "generator_app.py"]
