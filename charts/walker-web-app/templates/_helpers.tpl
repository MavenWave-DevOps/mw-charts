
{{- define "domain" -}}
  {{- if .Values.lifecycle }}
    {{- if eq .Values.lifecycle "prod" }}
      {{- required "REQUIRED: domain" .Values.domain }}
    {{- else }}
      {{- .Values.lifecycle -}}.{{- required "REQUIRED: domain" .Values.domain }}
    {{- end }}
  {{- else }}
    {{- .Values.domain -}}
  {{- end }}
{{- end }}


{{- define "registry_name" -}}
  {{ .Release.Name }}
{{- end -}}


{{- define "gke_project" -}}
  {{- required "REQUIRED: gke_project_id" .Values.gke_project_id }}
{{- end -}}


{{- define "db_project" -}}
  {{- required "REQUIRED: db_project_id" .Values.db_project_id }}
{{- end -}}


{{- define "app_project" -}}
  {{- required "REQUIRED: app_project_id" .Values.app_project_id -}}
{{- end -}}


{{- define "registry_dest" -}}
  {{ required "REQUIRED: registry" .Values.registry -}}/{{- include "app_project" . -}}/{{- include "registry_name" . -}}
{{- end -}}


{{- define "backend_image" -}}
  {{- include "registry_dest" $ -}}/backend:{{- .Values.backend.tag }}
{{- end -}}


{{- define "frontend_image" -}}
  {{- include "registry_dest" $ -}}/frontend:{{- .Values.frontend.tag }}
{{- end -}}


{{- define "db_name" -}}
  {{- .Values.lifecycle -}}-db
{{- end -}}


{{- define "instance_name" -}}
  {{- required "REQUIRED: db.instance" .Values.db.instance }}
{{- end -}}


{{- define "app_sa" -}}
  {{- required "REQUIRED: app_sa" .Values.app_sa }}
{{- end -}}


{{- define "ksa_name" -}}
  {{- "workload" }}
{{- end -}}


{{- define "bucket" -}}
  {{- if $.Values.public_bucket }}
    {{- $.Values.public_bucket }}
  {{- else }}
    {{- .Values.lifecycle -}}-{{- required "REQUIRED: app_code" .Values.app_code -}}-web-static
  {{- end }}
{{- end -}}


{{- define "private_bucket" -}}
  {{- if $.Values.private_bucket }}
    {{- $.Values.private_bucket }}
  {{- else }}
    {{- .Values.lifecycle -}}-{{- required "REQUIRED: app_code" .Values.app_code -}}-private
  {{- end }}
{{- end -}}


{{- define "ip_name" -}}
  {{- if $.Values.ip_name }}
    {{- $.Values.ip_name }}
  {{- else }}
    {{- $.Release.Name -}}-{{- $.Release.Namespace -}}-ip
  {{- end }}
{{- end -}}


