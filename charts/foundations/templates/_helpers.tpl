{{/*
clusterComponent returns a formatted cluster address based on the clusterDomain

Usage:
    {{include "clusterComponent" (list "k8s" .)}}
*/}}
{{- define "clusterComponent" -}}
{{- printf "https://%s.%s" (first .) ((last .).Values.foundations).intranetDomain -}}
{{- end -}}