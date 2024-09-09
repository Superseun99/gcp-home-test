
#!/bin/bash

# Variables
CLUSTER_NAME="mytestcluster"
ZONE="us-east1"
NUM_NODES=1
MACHINE_TYPE="e2-medium"
NETWORK="default"
SUBNETWORK="default"

# Check if the cluster exists
if gcloud container clusters describe $CLUSTER_NAME --zone $ZONE &> /dev/null; then
  echo "Cluster $CLUSTER_NAME already exists in zone $ZONE."
else
  echo "Cluster $CLUSTER_NAME does not exist. Creating the cluster..."
  gcloud container clusters create $CLUSTER_NAME \
    --zone $ZONE \
    --num-nodes $NUM_NODES \
    --machine-type $MACHINE_TYPE \
    --enable-ip-alias \
    --network $NETWORK \
    --subnetwork $SUBNETWORK
  
  if [ $? -eq 0 ]; then
    echo "Cluster $CLUSTER_NAME successfully created."
  else
    echo "Failed to create the cluster $CLUSTER_NAME."
    exit 1
  fi
fi
