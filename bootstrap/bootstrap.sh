#!/bin/sh

HERE=$(dirname $(readlink -f $0))
cilium_version=1.15.7
flux_version=2.13.0
set -ex

#TODO wish we could bundle this in a single apply, but
# - 'helm template' is not emitting the labels helm needs to upgrade it later
# - helm dependencies are just terrible

kubectl create namespace foundations
kubectl apply -f ${HERE}/user-skeleton.yaml
kubectl apply -f ${HERE}/bootstrap-sa.yaml

# helm repo add cilium https://helm.cilium.io/
helm install --namespace foundations cilium cilium/cilium --version $cilium_version --values ${HERE}/cilium-values.yaml

# helm repo add fluxcd https://fluxcd-community.github.io/helm-charts
flux_yaml=$(mktemp)
kubectl get configmap foundations-config -n foundations -o jsonpath='{.data.flux\.yaml}' >$flux_yaml
helm install --namespace foundations flux fluxcd/flux2 --version $flux_version --values $flux_yaml --wait --timeout 120s
rm $flux_yaml

foundations_yaml=$(mktemp)
kubectl get configmap foundations-config -n foundations -o jsonpath='{.data.foundations\.yaml}' >$foundations_yaml
helm install --namespace foundations foundations ${HERE}/../charts/foundations --values $foundations_yaml
rm $foundations_yaml
