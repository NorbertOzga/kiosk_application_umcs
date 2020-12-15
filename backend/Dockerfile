FROM python:3.8

ENV FLASK_APP run.py
ENV FLASK_DEBUG 1

COPY requirements.txt /tmp

RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt

COPY . /app
WORKDIR /app

CMD flask run