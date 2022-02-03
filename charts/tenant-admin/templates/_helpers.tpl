
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
  {{- include "lifecycle_letter" . -}}-{{- required "REQUIRED" platform_label" .Values.platform_label -}}-gke-project-{{- .Values.gke_project_suffix }}
{{- end -}}


{{- define "sa_project" -}}
  {{- required "REQUIRED" platform_label" .Values.platform_label -}}-sa-project-{{- .Values.sa_project_suffix }}
{{- end -}}


{{- define "dns_project" -}}
  {{- required "REQUIRED" platform_label" .Values.platform_label -}}-dns-project-{{- .Values.dns_project_suffix }}
{{- end -}}



{{- define "app_project" -}}
  {{- if .Values.tenant_project_id }}
    {{- .Values.tenant_project_id }}
  {{- else }}
    {{- required "REQUIRED" platform_label" .Values.platform_label -}}-{{- required "REQUIRED tenant_code" .Values.tenant_code -}}-project-{{- required "REQUIRED app_project_suffix" .Values.app_project_suffix }}
  {{- end }}
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



