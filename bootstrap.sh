#!/bin/sh

HERE=$(dirname $(readlink -f $0))
set -ex

#TODO wish we could bundle this in a single apply, but
# - 'helm template' is not emitting the labels helm needs to upgrade it later
# - helm dependencies are just terrible

kubectl create namespace --save-config foundations

# helm repo add cilium https://helm.cilium.io/
helm install --namespace foundations cilium cilium/cilium --version 1.15.7 --values ${HERE}/foundations/config/cilium-defaults.yaml

kubectl apply --namespace foundations --kustomize ${HERE}/flux

kubectl apply --namespace foundations --kustomize ${HERE}/foundations
