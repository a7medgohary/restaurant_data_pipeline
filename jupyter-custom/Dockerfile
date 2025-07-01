FROM python:3.11-slim

WORKDIR /app

# نثبت Java 17 + curl + procps
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk curl procps && \
    apt-get clean

# نحدد JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# نثبت المكتبات المطلوبة
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --retries 10 --timeout 300 -r requirements.txt

COPY . .

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
