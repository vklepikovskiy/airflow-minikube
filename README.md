# airflow-minikube
Minikube sandbox for Apache Airflow
## How to use
Install/upgrade minikube:
```
$ ./bin/minikube-install.sh
```
Start minikube cluster:
```
$ minikube start
```
Deploy Airflow to Minikube:
```
$ ./bin/start.sh all
```
Sync dags with Airflow
```
$ ./bin/start.sh sync-dags
```
Create virtual environment
```
$ ./bin/start.sh init-venv
```
Get sandbox URL (credentials: admin/admin):
```
$ ./bin/start.sh url
```
Run Airflow CLI command
```
$ ./bin/start.sh cli <command>
```