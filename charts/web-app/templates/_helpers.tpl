
{{- define "ip_name" }}
  {{- .Values.lifecycle -}}-{{- .Values.app_code }}-ip
{{- end }}


{{- define "branch" -}}

  {{- if eq .Values.lifecycle "prod" }}
    {{- "main" }}
  {{- else }}
    {{- required "REQUIRED: lifecycle" .Values.lifecycle }}
  {{- end }}

{{- end }}


{{- define "domain" -}}

  {{- if eq .Values.lifecycle "prod" }}
    {{- required "REQUIRED: domain" .Values.domain }}

  {{- else }}
    {{- .Values.lifecycle -}}.{{- required "REQUIRED: domain" .Values.domain }}

  {{- end }}

{{- end }}


{{- define "sa_project_id" -}}
  {{- required "REQUIRED: sa_project_id" .Values.sa_project_id }}
{{- end }}


{{- define "tenant_project_id" -}}
  {{- required "REQUIRED: tenant_project_id" .Values.tenant_project_id }}
{{- end }}


{{- define "artifact_repo" -}}
  {{- .Values.lifecycle -}}-{{- required "REQUIRED google.artifact_repo" .Values.google.artifact_repo }}
{{- end -}}


{{- define "api_image" -}}
  {{- .Values.google.region -}}-docker.pkg.dev/{{- include "tenant_project_id" . -}}/{{- include "artifact_repo" . }}/api:{{- .Values.api.image.tag }}
{{- end -}}


{{- define "nginx_image" -}}
  {{- .Values.google.region -}}-docker.pkg.dev/{{- include "tenant_project_id" . -}}/{{- include "artifact_repo" . }}/nginx:{{- .Values.nginx.image.tag }}
{{- end -}}


{{- define "workload_sa" -}}
  {{- required "REQUIRED: tenant_code" .Values.tenant_code -}}-{{- required "REQUIRED: app_code" .Values.app_code -}}-{{- required "REQUIRED: lifecycle" .Values.lifecycle -}}-workload@{{- include "sa_project_id" $ -}}.iam
{{- end -}}


{{- define "ksa_name" -}}
  {{- .Values.app_code -}}-web-app-sa
{{- end }}


{{- define "bucket" -}}
  {{- .Values.lifecycle -}}-{{- .Values.app_code -}}-private-bucket
{{- end -}}


