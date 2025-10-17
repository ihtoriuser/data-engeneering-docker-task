# Используем официальный образ Superset
FROM apache/superset:3.1.0

USER root

# Устанавливаем драйвер PostgreSQL и gevent
RUN pip install --no-cache-dir pg8000 gevent


# Возвращаем права пользователю Superset
USER superset

# Копируем локальный конфиг
COPY superset_config.py /app/pythonpath/superset_config.py
