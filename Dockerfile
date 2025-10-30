FROM apache/superset:3.1.0

USER root

RUN pip install --no-cache-dir pg8000 gevent


USER superset

COPY superset_config.py /app/pythonpath/superset_config.py
