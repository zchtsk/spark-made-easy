import os
import pathlib
import sys


def create_fastapi_service(image_name: str):
    contents = f"""
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: spark-made-easy
  generation: 1
  annotations:
    run.googleapis.com/client-name: gcloud
    run.googleapis.com/ingress: all
    run.googleapis.com/ingress-status: all
spec:
  template:
    metadata:
      annotations:
        autoscaling.knative.dev/minScale: '0'
        autoscaling.knative.dev/maxScale: '3'
    spec:
      containerConcurrency: 500
      timeoutSeconds: 300
      containers:
        - image: {image_name}
          ports:
            - name: http1
              containerPort: 80
          resources:
            limits:
              memory: 1024Mi
              cpu: 1000m
  traffic:
    - percent: 100
      latestRevision: true 
    """
    save_path = pathlib.Path(__file__) / '../../ci/sme_service.yaml'
    print(save_path)
    with open(save_path, 'w') as file:
        file.write(contents)

if __name__ == '__main__':
    image_name = sys.argv[1]
    create_fastapi_service(image_name)