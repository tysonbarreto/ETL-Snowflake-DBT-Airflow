FROM quay.io/astronomer/astro-runtime:12.6.0

RUN python -m venv snowflake_venv &&\
    source snowflake_venv/bin/activate &&\
    pip install --no-cache-dir dbt-snowflake && deactivate
