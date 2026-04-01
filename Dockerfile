FROM python:3.10-slim

WORKDIR /app/

# Added build-essential and python3-dev to compile GitHub packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -U -r requirements.txt

CMD ["bash", "start.sh"]
