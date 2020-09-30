#!/bin/bash

set -e

# cluster
minikube start --cni=calico --memory=10000 --cpus=4 --network-plugin=cni

## flux
sudo snap install fluxctl --classic
kubectl create ns flux
export GHUSER="axelgobletbdr"
fluxctl install \
  --git-user=${GHUSER} \
  --git-email=${GHUSER}@users.noreply.github.com \
  --git-url=git@github.com:${GHUSER}/flux-get-started \
  --git-path=namespaces,workloads \
  --namespace=flux | kubectl apply -f -
