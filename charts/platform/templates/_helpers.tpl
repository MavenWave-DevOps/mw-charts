
{{- define "helm_repo_url" -}}
  {{- required "REQUIRED: helm_repo_url" $.Values.helm_repo_url -}}
{{- end }}


{{- define "app_repo_name" -}}
  {{- required "REQUIRED: app_repo_name" $.Values.app_repo_name -}}
{{- end }}


{{- define "tenant_code" -}}
  {{- required "REQUIRED: tenant_code" $.Values.tenant_code -}}
{{- end }}


{{- define "sa_project_id" -}}
  {{- required "REQUIRED: sa_project_id" $.Values.sa_project_id -}}
{{- end -}}


{{- define "app_project_id" -}}
  {{- required "REQUIRED: app_project_id" $.Values.app_project_id -}}
{{- end -}}


{{- define "db_project_id" -}}
  {{- required "REQUIRED: db_project_id " $.Values.db_project_id -}}
{{- end -}}


{{- define "target_revision" -}}
  {{- if $.Values.target_revision }}
    {{- $.Values.target_revision }}
  {{- else }}
    {{- "main" -}}
  {{- end }}
{{- end }}
