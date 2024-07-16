#!/bin/sh

HERE=$(dirname $(readlink -f $0))
set -ex

#TODO wish we could bundle this in a single apply, but
# - 'helm template' is not emitting the labels helm needs to upgrade it later 
# - helm dependencies are just terrible

kubectl create namespace foundations
kubectl apply -f ${HERE}/user-skeleton.yaml
helm install --namespace foundations cilium cilium/cilium --version 1.15.7 --values ${HERE}/cilium-values.yaml
flux install --namespace foundations
helm install --namespace foundations foundations  ${HERE}/../charts/foundations --version 0.1.0

