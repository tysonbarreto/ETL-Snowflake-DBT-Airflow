import os
from datetime import datetime

from cosmos import DbtDag, ProfileConfig, ExecutionConfig, ProjectConfig
from cosmos.profiles import SnowflakeUserPasswordProfileMapping


profile_config = ProfileConfig(
    profile_name="default",
    target_name="dev",
    profile_mapping=SnowflakeUserPasswordProfileMapping(
        conn_id="snowflake_conn",
        profile_args={"database":"dbt_db", "schema":"dbt_schema"}
    )
)

dbt_snowflake_dag=DbtDag(
    project_config=ProjectConfig("/usr/local/airflow/dags/dbt/snowflake"),
    operator_args={"install_deps":True},
    profile_config=profile_config,
    execution_config=ExecutionConfig(dbt_executable_path="/usr/local/airflow/snowflake_venv/bin/dbt"),
    schedule_interval="@daily",
    start_date=datetime(2025,1,1),
    catchup=False,
    dag_id="dbt_dag"
)

dbt_snowflake_dag