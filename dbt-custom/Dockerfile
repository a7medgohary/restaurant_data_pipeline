FROM python:3.10-slim

# تحديث النظام وتنصيب bash وgit
RUN apt-get update && apt-get install -y \
    git \
    bash \
    && apt-get clean

# تنصيب dbt-bigquery
RUN pip install dbt-bigquery==1.7.9

WORKDIR /dbt
