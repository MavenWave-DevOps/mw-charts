
{{- define "gcp_project_id" -}}
  {{- required "REQUIRED: gcp_project_id " $.Values.gcp_project_id -}}
{{- end -}}


{{- define "admin_sa" -}}
  {{- required "REQUIRED: admin_sa " $.Values.admin_sa -}}
{{- end }}

