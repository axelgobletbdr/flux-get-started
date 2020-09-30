#!/bin/bash

set -e

kubectl create --dry-run=client -o yaml ns nginx
echo ---
kubectl create --dry-run=client -o yaml deploy --image nginx -n nginx nginx
echo ---
kubectl create --dry-run=client -o yaml deploy --image nginx -n nginx nginx2
