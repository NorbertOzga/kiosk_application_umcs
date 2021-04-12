# DEPENDENCIES
FROM python:3.9 AS deps

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements /tmp/requirements

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN ls /tmp
RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt


# TEST DEPENDENCIES
FROM deps as test_deps

RUN pip install -r /tmp/requirements/test.txt


# DEVELOPEMENT
FROM deps AS dev_server

ENV FLASK_APP run.py
ENV FLASK_DEBUG 1

COPY . /app
WORKDIR /app


# TESTS
FROM test_deps AS test

RUN apt-get update && apt-get install -y --no-install-recommends redis

COPY . /app
WORKDIR /app

RUN chmod +x /app/tests/tests_runner.sh
