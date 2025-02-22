from datetime import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator

with DAG("test", start_date=datetime(2025, 1, 1), schedule_interval="@daily", catchup=False) as dag:
    
    t1 = BashOperator(task_id="test_task", bash_command="echo Hello World")

    t2 = BashOperator(task_id="test_task2", bash_command="echo Hello World2")

    t1 >> t2
