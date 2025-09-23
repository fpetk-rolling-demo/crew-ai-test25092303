FROM registry.access.redhat.com/ubi9/python-311:latest
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1
WORKDIR /app
COPY pyproject.toml .
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir .
COPY . .
EXPOSE 8501
USER 1001
ENTRYPOINT [ "streamlit", "run", "crew_ai_crew.py" ]
