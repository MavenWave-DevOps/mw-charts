
{{- define "infra_admin_sa" -}}
  {{- required "REQUIRED: lifecycle" .Values.lifecycle }}-{{- .Values.tenant_code -}}-tenant-admin@{{- include "sa_project" . -}}.iam.gserviceaccount.com
{{- end }}


{{- define "ip_name" }}
  {{- .Values.tenant_code }}-global-ip
{{- end }}


{{- define "lifecycle_letter" -}}
  {{- substr 0 1 .Values.lifecycle -}}
{{- end }}


{{- define "branch" -}}

  {{- if eq .Values.lifecycle "prod" }}
    {{- "main" }}
  {{- else }}
    {{- .Values.lifecycle }}
  {{- end }}

{{- end }}


{{- define "domain" -}}

  {{- if eq .Values.lifecycle "prod" }}
    {{- .Values.tenant_code -}}.{{- required "REQUIRED: google.domain" .Values.google.domain }}

  {{- else }}
    {{- .Values.lifecycle -}}.{{- .Values.tenant_code -}}.{{- required "REQUIRED: google.domain" .Values.google.domain }}

  {{- end }}

{{- end }}


{{- define "gke_project" -}}
  {{- include "lifecycle_letter" . -}}-anthos-gke-project-{{- .Values.gke_project_suffix }}
{{- end -}}


{{- define "sa_project" -}}
  {{- "anthos-svc-acct-project-xwc" }}
{{- end -}}


{{- define "dns_project" -}}
  {{- "anthos-dns-project-tby" }}
{{- end -}}



{{- define "app_project" -}}
  anthos-{{- required "REQUIRED tenant_code" .Values.tenant_code -}}-project-{{- required "REQUIRED app_project_suffix" .Values.app_project_suffix }}
{{- end -}}


{{- define "artifact_repo" -}}
  {{- .Values.lifecycle -}}-{{- required "REQUIRED google.artifact_repo" .Values.google.artifact_repo }}
{{- end -}}


{{- define "api_image" -}}
  {{- .Values.google.region -}}-docker.pkg.dev/{{- include "app_project" . -}}/{{- include "artifact_repo" . }}/api:{{- .Values.api.image.tag }}
{{- end -}}


{{- define "nginx_image" -}}
  {{- .Values.google.region -}}-docker.pkg.dev/{{- include "app_project" . -}}/{{- include "artifact_repo" . }}/nginx:{{- .Values.nginx.image.tag }}
{{- end -}}


{{- define "app_sa" -}}
  {{- .Values.lifecycle -}}-{{- required "REQUIRED: tenant_code" .Values.tenant_code -}}-tenant-admin@{{- include "sa_project" . -}}.iam
{{- end -}}


{{- define "ksa_name" -}}
  {{- .Values.tenant_code -}}-web-app-sa
{{- end }}


{{- define "bucket" -}}
  {{- .Values.lifecycle -}}-{{- .Values.tenant_code -}}-private-bucket
{{- end -}}


