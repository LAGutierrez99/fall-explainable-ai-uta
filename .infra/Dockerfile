FROM python:3.11-slim

WORKDIR /app

# Prevent tzdata from prompting for user input
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies safely
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    ca-certificates \
    apt-transport-https \
    tzdata \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--notebook-dir=/app"]
