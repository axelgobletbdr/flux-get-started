#!/bin/bash

set -e

kubectl create --dry-run=client -o yaml ns nginx
kubectl create --dry-run=client -o yaml deploy --image nginx -n nginx nginx
kubectl create --dry-run=client -o yaml deploy --image nginx -n nginx nginx2
