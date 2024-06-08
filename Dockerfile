FROM python:3.11-slim

WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir gunicorn

EXPOSE 80
CMD ["gunicorn", "--bind", "0.0.0.0:80", "appplication:application"]