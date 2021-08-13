#!/bin/bash -e


helm install ingress-nginx \
    -n ingress \
    --create-namespace \
    --set controller.service.annotations."kubernetes\.io/ingress\.global-static-ip-name"="ws-static" \
    ingress-nginx/ingress-nginx

