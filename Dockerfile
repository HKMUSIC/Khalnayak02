FROM python:3.10-slim

# Set the working directory first
WORKDIR /app/

# Install system dependencies WITHOUT the unnecessary bloat
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Copy your application code
COPY . /app/

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -U -r requirements.txt

# Start the bot
CMD ["bash", "start.sh"]
