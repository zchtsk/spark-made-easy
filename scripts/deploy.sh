#!/bin/bash

# Check if PROJECT_NAME is set
if [ -z "$PROJECT_NAME" ]; then
    echo "PROJECT_NAME environment variable is not set."
    exit 1
fi

# Get the latest tag number from local Docker images
# This command lists all tags, extracts the numbers, sorts them, and gets the last one
latest_tag=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep "^gcr.io/$PROJECT_NAME/spark-made-easy:" | sed 's/[^0-9]*//g' | sort -nr | head -n 1)
echo "latest tag: $latest_tag"

# Check if a tag was found. If not, start with 0001
if [ -z "$latest_tag" ]; then
    latest_tag="0000"
fi

# Increment the tag by 1 with zero padding
next_tag=$(printf "%04d" $((10#$latest_tag + 1)))

# Create the new docker tag
echo "making gcr.io/$PROJECT_NAME/spark-made-easy:$next_tag"
docker tag zachtsk/spark-made-easy:latest gcr.io/$PROJECT_NAME/spark-made-easy:$next_tag

# Push the new tag to the repository
echo "pushing gcr.io/$PROJECT_NAME/spark-made-easy:$next_tag"
docker push gcr.io/$PROJECT_NAME/spark-made-easy:$next_tag

# Run the build_service_yaml.py script to create the new service yaml file. Pass the full docker image name
echo "Creating service yaml file"
python scripts/build_service_yaml.py gcr.io/$PROJECT_NAME/spark-made-easy:$next_tag

# Launch service
gcloud run services replace ci/sme_service.yaml --region=$REGION

# Make site public
gcloud run services set-iam-policy spark-made-easy ci/policy.yaml --region=$REGION --quiet