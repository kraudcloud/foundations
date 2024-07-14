apply.yaml: .PHONY
	echo --- > $@
	cat namespace.yaml >> "$@"
	echo --- >> $@
	helm template argo --namespace kcef-system argo/argo-cd --version 7.3.3 >> $@
	echo --- >> $@
	helm template cilum --namespace kcef-system cilium/cilium --version 1.15.7 --values cilium-values.yaml >> $@ 
	echo --- >> $@
	cat kcef-system.yaml >> $@

.PHONY:


