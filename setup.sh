#!/bin/bash

set -e

# cluster
minikube start --cni=calico --memory=10000 --cpus=4 --network-plugin=cni

# flux
sudo snap install fluxctl --classic
kubectl create ns flux
export GHUSER="axelgobletbdr"
fluxctl install \
  --git-user=${GHUSER} \
  --git-email=${GHUSER}@users.noreply.github.com \
  --git-url=git@github.com:${GHUSER}/flux-get-started \
  --git-path=namespaces,workloads \
  --namespace=flux | kubectl apply -f -
# add the following args to flux deployment:
# --sync-garbage-collection
# --manifest-generation=true

# helm operator
kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/1.2.0/deploy/crds.yaml
kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/1.2.0/deploy/rbac.yaml
kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/1.2.0/deploy/deployment.yaml
kubectl patch -n flux deploy helm-operator -p='{"spec": {"template":{"spec":{"containers":[{"name": "helm-operator", "args": ["--enabled-helm-versions=v3"]}]}}}}'
