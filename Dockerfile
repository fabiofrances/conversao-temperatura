FROM python:3.8-slim
WORKDIR /app
COPY requirements.txt .
RUN python -m pip install -r requirements.txt
COPY . /app
EXPOSE 5000
CMD ["gunicorne", "--workers=3", "--bind", "0.0.0.0:5000", "-c", "config.py", "app:app"]