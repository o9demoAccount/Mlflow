FROM python:3.13.11

ARG DEPENDENCIES

RUN pip install psycopg2 pymysql mysqlclient pytest pytest-cov
RUN echo "${DEPENDENCIES}" > /tmp/requriements.txt && pip install -r /tmp/requriements.txt
RUN pip list
