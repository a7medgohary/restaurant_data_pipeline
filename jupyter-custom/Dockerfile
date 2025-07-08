FROM python:3.11-slim

WORKDIR /app

# Install system dependencies (Java, build tools, etc.)
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk curl procps build-essential && \
    apt-get clean

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Copy requirements file early for Docker caching
COPY requirements.txt .

# Install Python dependencies separately to allow caching
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code
COPY . .

# Expose port for Jupyter
EXPOSE 8888

# Run JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
