#!/bin/bash

set -e

kubectl create --dry-run -o yaml ns nginx
echo ---
kubectl create --dry-run -o yaml deploy --image nginx -n nginx nginx
