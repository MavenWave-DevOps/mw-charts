
{{- define "domain" -}}
  {{- required "REQUIRED: domain" $.Values.domain -}}
{{- end }}


{{- define "workflows_sa" -}}
  {{- required "REQUIRED: workflows_sa" $.Values.workflows_sa -}}
{{- end }}


{{- define "gke_project_id" -}}
  {{- required "REQUIRED: gke_project_id" $.Values.gke_project_id -}}
{{- end }}


