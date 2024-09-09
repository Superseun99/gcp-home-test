#!/bin/bash

BUCKET_NAME="ter-bucket"
LOCATION="us-east1"

# Check if the bucket exists
if gsutil ls -b gs://$BUCKET_NAME >/dev/null 2>&1; then
  echo "Bucket $BUCKET_NAME already exists."
else
  # Create the bucket if it doesn't exist
  gcloud storage buckets create gs://$BUCKET_NAME --location $LOCATION
  echo "Bucket $BUCKET_NAME created in $LOCATION."
fi
