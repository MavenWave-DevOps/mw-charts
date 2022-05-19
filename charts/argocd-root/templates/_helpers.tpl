
{{- define "app_repo_name" -}}
  {{- required "REQUIRED: app_repo_name" $.Values.app_repo_name -}}
{{- end }}


{{- define "targetRevision" -}}
  {{- if .Values.targetRevision }}
    {{- .Values.targetRevision }}
  {{- else }}
    {{- "main" }}
  {{- end }}
{{- end }}


{{- define "repo_url" -}}
  {{- "git@github.com:" -}}{{ required "REQUIRED: github_org" .Values.github_org -}}/{{- required "REQUIRED: repo_name" .Values.repo_name }}
{{- end }}


{{- define "admin_folder_id" -}}
  {{- required "REQUIRED: admin_folder_id" $.Values.admin_folder_id -}}
{{- end -}}


{{- define "sa_project_id" -}}
  {{- required "REQUIRED: sa_project_id" $.Values.sa_project_id -}}
{{- end -}}


{{- define "dns_project_id" -}}
  {{- required "REQUIRED: dns_project_id" $.Values.dns_project_id -}}
{{- end -}}


{{- define "gke_project_id" -}}
  {{- required "REQUIRED: gke_project_id" $.Values.gke_project_id -}}
{{- end -}}


{{- define "db_project_id" -}}
  {{- required "REQUIRED: db_project_id" $.Values.db_project_id -}}
{{- end -}}


{{- define "app_project_id" -}}
  {{- required "REQUIRED: app_project_id" $.Values.app_project_id -}}
{{- end -}}


{{- define "admin_sa" -}}
walker-admin@{{- required "REQUIRED: sa_project_id" $.Values.sa_project_id -}}.iam.gserviceaccount.com
{{- end -}}


{{- define "admin_sa" -}}
secrets-admin@{{- required "REQUIRED: sa_project_id" $.Values.sa_project_id -}}.iam.gserviceaccount.com
{{- end -}}


{{- define "dns_admin_sa" -}}
dns-admin@{{- required "REQUIRED: sa_project_id" $.Values.sa_project_id -}}.iam.gserviceaccount.com
{{- end -}}



