
{{- define "infra_admin_sa" -}}
  {{- required "REQUIRED: lifecycle" .Values.lifecycle }}-{{- .Values.tenant_code -}}-tenant-admin@{{- include "sa_project_id" . -}}.iam.gserviceaccount.com
{{- end }}


{{- define "ip_name" }}
  {{- .Values.tenant_code }}-global-ip
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
  {{- .Values.lifecycle -}}-{{- required "REQUIRED: tenant_code" .Values.tenant_code -}}-app-workload@{{- include "sa_project_id" . -}}.iam
{{- end -}}


{{- define "ksa_name" -}}
  {{- .Values.tenant_code -}}-web-app-sa
{{- end }}


{{- define "bucket" -}}
  {{- .Values.lifecycle -}}-{{- .Values.tenant_code -}}-private-bucket
{{- end -}}


