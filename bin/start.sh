#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Please provide the command to run"
    exit 1
fi

case $1 in
    # List Airflow resources commands
    "list-deployments")
        echo "Listing all Airflow deployments"
        minikube kubectl -- get deployments -l app=airflow
        ;;
    "list-replicasets")
        echo "Listing all Airflow replica sets"
        minikube kubectl -- get replicasets -l app=airflow
        ;;
    "list-pods")
        echo "Listing all Airflow pods"
        minikube kubectl -- get pods -l app=airflow
        ;;
    "list-services")
        echo "Listing all Airflow services"
        minikube kubectl -- get services -l app=airflow
        ;;
    "list-jobs")
        echo "Listing all Airflow jobs"
        minikube kubectl -- get jobs -l app=airflow
        ;;
    "list-configmaps")
        echo "Listing all Airflow configmaps"
        minikube kubectl -- get configmaps -l app=airflow
        ;;
    "list-persistentvolumes")
        echo "Listing all Airflow persistent volumes and claims"
        minikube kubectl -- get persistentvolumes,persistentvolumeclaims -l app=airflow
        ;;
    "list-all")
        echo "Listing all Airflow resources"
        minikube kubectl -- get deployments,replicasets,pods,service,jobs,configmaps,persistentvolumes,persistentvolumeclaims -l app=airflow
        ;;
    "list-postgres")
        echo "Listing all postgres resources"
        minikube kubectl -- get deployments,replicasets,pods,service,jobs,configmaps,persistentvolumes,persistentvolumeclaims -l app=airflow,component=postgres
        ;;
    "list-migrations")
        echo "Listing all migrations resources"
        minikube kubectl -- get deployments,replicasets,pods,service,jobs,configmaps,persistentvolumes,persistentvolumeclaims -l app=airflow,component=migrations
        ;;
    "list-create-user")
        echo "Listing all create-user resources"
        minikube kubectl -- get deployments,replicasets,pods,service,jobs,configmaps,persistentvolumes,persistentvolumeclaims -l app=airflow,component=create-user
        ;;
    "list-webserver")
        echo "Listing all webserver resources"
        minikube kubectl -- get deployments,replicasets,pods,service,jobs,configmaps,persistentvolumes,persistentvolumeclaims -l app=airflow,component=webserver
        ;;
    "list-scheduler")
        echo "Listing all scheduler resources"
        minikube kubectl -- get deployments,replicasets,pods,service,jobs,configmaps,persistentvolumes,persistentvolumeclaims -l app=airflow,component=scheduler
        ;;
    "list-config")
        echo "Listing all config resources"
        minikube kubectl -- get deployments,replicasets,pods,service,jobs,configmaps,persistentvolumes,persistentvolumeclaims -l app=airflow,component=config
        ;;

    # Delete Airflow resources commands
    "delete-deployments")
        echo "Deleting all Airflow deployments"
        minikube kubectl -- delete deployments -l app=airflow
        ;;
    "delete-replicasets")
        echo "Deleting all Airflow replica sets"
        minikube kubectl -- delete replicasets -l app=airflow
        ;;
    "delete-pods")
        echo "Deleting all Airflow pods"
        minikube kubectl -- delete pods -l app=airflow
        ;;
    "delete-services")
        echo "Deleting all Airflow services"
        minikube kubectl -- delete services -l app=airflow
        ;;
    "delete-jobs")
        echo "Deleting all Airflow jobs"
        minikube kubectl -- delete jobs -l app=airflow
        ;;
    "delete-configmaps")
        echo "Deleting all Airflow configmaps"
        minikube kubectl -- delete configmaps -l app=airflow
        ;;
    "delete-persistentvolumes")
        echo "Deleting all Airflow persistent volumes and claims"
        minikube kubectl -- delete persistentvolumes,persistentvolumeclaims -l app=airflow
        ;;
    "delete-all")
        echo "Deleting all Airflow resources"
        minikube kubectl -- delete deployments,replicasets,pods,services,jobs,configmaps -l app=airflow
        ;;
    "delete-postgres")
        echo "Deleting all postgres resources"
        minikube kubectl -- delete deployments,replicasets,pods,services,jobs,configmaps -l app=airflow,component=postgres
        ;;
    "delete-migrations")
        echo "Deleting all migrations resources"
        minikube kubectl -- delete deployments,replicasets,pods,services,jobs,configmaps -l app=airflow,component=migrations
        ;;
    "delete-create-user")
        echo "Deleting all create-user resources"
        minikube kubectl -- delete deployments,replicasets,pods,services,jobs,configmaps -l app=airflow,component=create-user
        ;;
    "delete-webserver")
        echo "Deleting all webserver resources"
        minikube kubectl -- delete deployments,replicasets,pods,services,jobs,configmaps -l app=airflow,component=webserver
        ;;
    "delete-scheduler")
        echo "Deleting all scheduler resources"
        minikube kubectl -- delete deployments,replicasets,pods,services,jobs,configmaps -l app=airflow,component=scheduler
        ;;
    "delete-config")
        echo "Deleting all config resources"
        minikube kubectl -- delete deployments,replicasets,pods,services,jobs,configmaps -l app=airflow,component=config
        ;;

    # Logs commands
    "logs-postgres")
        echo "Getting logs for Postgres"
        minikube kubectl -- logs -l app=airflow,component=postgres
        ;;
    "logs-migrations")
        echo "Getting logs for Airflow migrations job"
        minikube kubectl -- logs -l app=airflow,component=migrations
        ;;
    "logs-create-user")
        echo "Getting logs for Airflow create-user job"
        minikube kubectl -- logs -l app=airflow,component=create-user
        ;;
    "logs-webserver")
        echo "Getting logs for Airflow webserver"
        minikube kubectl -- logs -l app=airflow,component=webserver
        ;;
    "logs-scheduler")
        echo "Getting logs for Airflow scheduler"
        minikube kubectl -- logs -l app=airflow,component=scheduler
        ;;

    # Deploy commands
    "postgres")
        echo "Deploying Postgres"
        minikube kubectl -- apply -f manifests/configmaps/postgres-env.yaml
        minikube kubectl -- apply -f manifests/persistentvolumes/postgres.yaml
        minikube kubectl -- apply -f manifests/deployments/postgres.yaml
        minikube kubectl -- apply -f manifests/services/postgres.yaml
        ;;
    "migrations")
        echo "Running migrations"
        minikube kubectl -- apply -f manifests/configmaps/airflow-env.yaml
        minikube kubectl -- apply -f manifests/jobs/migrations.yaml
        ;;
    "create-user")
        echo "Creating Airflow user"
        minikube kubectl -- apply -f manifests/configmaps/airflow-env.yaml
        minikube kubectl -- apply -f manifests/jobs/create-user.yaml
        ;;
    "webserver")
        echo "Deploying Airflow webserver"
        minikube kubectl -- apply -f manifests/configmaps/airflow-env.yaml
        minikube kubectl -- apply -f manifests/persistentvolumes/dags.yaml
        minikube kubectl -- apply -f manifests/persistentvolumes/logs.yaml
        minikube kubectl -- apply -f manifests/deployments/webserver.yaml
        minikube kubectl -- apply -f manifests/services/webserver.yaml
        ;;
    "scheduler")
        echo "Deploying Airflow scheduler"
        minikube kubectl -- apply -f manifests/configmaps/airflow-env.yaml
        minikube kubectl -- apply -f manifests/persistentvolumes/dags.yaml
        minikube kubectl -- apply -f manifests/persistentvolumes/logs.yaml
        minikube kubectl -- apply -f manifests/deployments/scheduler.yaml
        ;;
    "all")
        $0 postgres
        $0 migrations
        $0 create-user
        $0 webserver
        $0 scheduler
        ;;

    # Other commands
    "init-venv")
        echo "Initializing virtual environment"
        if [ ! -d .venv ]; then
            python3 -m venv .venv
        fi
        source .venv/bin/activate
        pip install -r requirements.txt
        ;;
    "sync-dags")
        echo "Syncing dags"
        for file in $(ls dags/*.py); do
            echo "Copying $file"
            minikube cp $file /mnt/data/airflow/$file
        done
        ;;
    "cli")
        echo "Running Airflow CLI"
        shift
        minikube kubectl -- exec -it $(minikube kubectl -- get pods -l app=airflow,component=scheduler -o jsonpath="{.items[0].metadata.name}") -c airflow-scheduler -- airflow $@
        ;;
    "url")
        echo "Getting Airflow webserver URL"
        minikube service --url airflow-webserver
        ;;

    *)
        echo "Invalid command"
        exit 2
        ;;
esac