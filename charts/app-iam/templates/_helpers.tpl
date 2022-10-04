
{{- define "sa_project_id" -}}
  {{- required "REQUIRED: sa_project_id" $.Values.sa_project_id -}}
{{- end -}}


{{- define "dns_project_id" -}}
  {{- required "REQUIRED: dns_project_id " $.Values.dns_project_id -}}
{{- end -}}


{{- define "gke_project_id" -}}
  {{- required "REQUIRED: gke_project_id" $.Values.gke_project_id -}}
{{- end -}}


{{- define "db_project_id" -}}
  {{- required "REQUIRED: db_project_id " $.Values.db_project_id -}}
{{- end -}}


{{- define "app_project_id" -}}
  {{- required "REQUIRED: app_project_id " $.Values.app_project_id -}}
{{- end -}}


{{- define "workspace_service_account" -}}
  {{- required "REQUIRED: workspace_service_account" .Values.workspace_service_account }}
{{- end }}

