FROM python:3.10-slim

RUN apt-get update && apt-get install -y git bash && apt-get clean

# ✅ ثبت dbt مع PostgreSQL adapter
RUN pip install dbt-postgres==1.7.9

WORKDIR /dbt
