#!/bin/bash

set -e

echo ---
kubectl create --dry-run -o yaml deploy --image nginx -n nginx nginx2
echo ---
kubectl create --dry-run -o yaml deploy --image nginx -n nginx nginx3
echo ---
kubectl create --dry-run -o yaml ns nginx