FROM python:3.12-slim

# Install runtime dependencies and create a non-root user.
RUN apt-get update && apt-get install -y --no-install-recommends \
    dumb-init \
    && pip install --no-cache-dir "litellm[proxy]" \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --shell /bin/bash --uid 1000 app

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONHASHSEED=random

COPY --chown=app:app . .

USER app

EXPOSE 3455

ENTRYPOINT ["dumb-init", "--"]
CMD ["litellm", "--config", "/app/config.yaml", "--host", "0.0.0.0", "--port", "3455"]
