
{{- define "infra_admin_sa" -}}
  {{- required "REQUIRED: lifecycle" .Values.lifecycle }}-{{- .Values.tenant_code -}}-tenant-admin@{{- include "sa_project_id" . -}}.iam.gserviceaccount.com
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
    {{- required "REQUIRED: domain" .Values.domain }}

  {{- else }}
    {{- .Values.lifecycle -}}.{{- required "REQUIRED: domain" .Values.domain }}

  {{- end }}

{{- end }}


{{- define "sa_project_id" -}}
  {{- if .Values.sa_project_id }}
    {{- .Values.sa_project_id }}
  {{- else }}
    {{- include "lifecycle_letter" . }}-{{ required "REQUIRED: platform_label" .Values.platform_label }}-sa-project-{{ required "REQUIRED: sa_project_suffix" .Values.sa_project_suffix }}
  {{- end }}
{{- end }}


{{- define "dns_project_id" -}}
  {{- if .Values.dns_project_id }}
    {{- .Values.dns_project_id }}
  {{- else }}
    {{- include "lifecycle_letter" . }}-{{ required "REQUIRED: platform_label" .Values.platform_label }}-dns-project-{{ required "REQUIRED: dns_project_suffix" .Values.dns_project_suffix }}
  {{- end }}
{{- end }}


{{- define "gke_project_id" -}}
  {{- if .Values.gke_project_id }}
    {{- .Values.gke_project_id }}
  {{- else }}
    {{- include "lifecycle_letter" . }}-{{ required "REQUIRED: platform_label" .Values.platform_label }}-gke-project-{{ required "REQUIRED: gke_project_suffix" .Values.gke_project_suffix }}
  {{- end }}
{{- end }}


{{- define "tenant_project_id" -}}
  {{- if .Values.tenant_project_id }}
    {{- .Values.tenant_project_id }}
  {{- else }}
    {{- required "REQUIRED platform_label" .Values.platform_label -}}-{{- required "REQUIRED tenant_code" .Values.tenant_code -}}-project-{{- required "REQUIRED tenant_project_suffix" .Values.tenant_project_suffix }}
  {{- end }}
{{- end -}}




{{- define "artifact_repo" -}}
  {{- .Values.lifecycle -}}-{{- required "REQUIRED google.artifact_repo" .Values.google.artifact_repo }}
{{- end -}}


{{- define "api_image" -}}
  {{- .Values.google.region -}}-docker.pkg.dev/{{- include "tenant_project_id" . -}}/{{- include "artifact_repo" . }}/api:{{- .Values.api.image.tag }}
{{- end -}}


{{- define "nginx_image" -}}
  {{- .Values.google.region -}}-docker.pkg.dev/{{- include "tenant_project_id" . -}}/{{- include "artifact_repo" . }}/nginx:{{- .Values.nginx.image.tag }}
{{- end -}}


{{- define "tenant_admin_sa" -}}
  {{- .Values.lifecycle -}}-{{- required "REQUIRED: tenant_code" .Values.tenant_code -}}-tenant-admin@{{- include "sa_project_id" . -}}.iam
{{- end -}}


{{- define "ksa_name" -}}
  {{- .Values.tenant_code -}}-web-app-sa
{{- end }}


{{- define "bucket" -}}
  {{- .Values.lifecycle -}}-{{- .Values.tenant_code -}}-private-bucket
{{- end -}}


