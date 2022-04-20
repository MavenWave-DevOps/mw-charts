

{{- define "domain" -}}
  {{- required "REQUIRED: domain" $.Values.domain -}}
{{- end }}


{{- define "vault_sa" -}}
  {{- required "REQUIRED: vault_sa" $.Values.vault_sa -}}
{{- end }}


{{- define "gke_project_id" -}}
  {{- required "REQUIRED: gke_project_id" $.Values.gke_project_id -}}
{{- end }}


