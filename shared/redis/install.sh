#!/bin/bash -e

helm install test-redis \
    -n redis \
    --create-namespace \
    --set auth.enabled=false \
    --set auth.sentinel=false \
    --set replica.replicaCount=1 \
bitnami/redis
