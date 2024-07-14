apply.yaml: .PHONY
	echo --- > $@
	cat namespace.yaml >> "$@"
	echo --- >> $@
	helm template argocd --namespace kcef-system argo/argo-cd --version 7.3.3 >> $@
	echo --- >> $@
	helm template cilum --namespace kcef-system cilium/cilium --version 1.15.7 --values cilium-values.yaml >> $@ 
	echo --- >> $@
	cat ../charts/kcef-system/templates/project.yaml  >> $@
	echo --- >> $@
	cat ../charts/kcef-system/templates/kcef-system.yaml  >> $@

.PHONY:


