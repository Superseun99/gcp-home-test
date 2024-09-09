#!/bin/bash

# Variables
PIPELINE_FILE="./pipeline.yaml"
REGION="us-east1"

# Get the pipeline name from the pipeline.yaml file using yq or manually define it
# Make sure yq is installed or adjust the script to use another method if needed.
PIPELINE_NAME=$(yq eval '.name' $PIPELINE_FILE)

# Check if the pipeline exists
if gcloud deploy pipelines describe $PIPELINE_NAME --region $REGION &> /dev/null; then
  echo "Pipeline $PIPELINE_NAME already exists in region $REGION."
else
  echo "Pipeline $PIPELINE_NAME does not exist. Applying the pipeline configuration..."
  gcloud deploy apply --file $PIPELINE_FILE --region $REGION
  
  if [ $? -eq 0 ]; then
    echo "Pipeline $PIPELINE_NAME successfully applied."
  else
    echo "Failed to apply the pipeline $PIPELINE_NAME. is already created"
    exit 1
  fi
fi
