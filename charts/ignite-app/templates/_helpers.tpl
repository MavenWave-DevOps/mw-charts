
{{- define "domain" -}}
  {{- required "REQUIRED: domain" .Values.domain -}}
{{- end -}}


{{- define "frontend_image" -}}
  {{- .Values.google.region -}}-docker.pkg.dev/{{- .Values.google.project -}}/{{- required "REQUIRED: app_name" .Values.app_name -}}/frontend:{{- .Values.frontend.tag }}
{{- end -}}


{{- define "backend_image" -}}
  {{- .Values.google.region -}}-docker.pkg.dev/{{- .Values.google.project -}}/{{- required "REQUIRED: app_name" .Values.app_name -}}/backend:{{- .Values.backend.tag }}
{{- end -}}


{{- define "app_sa" -}}
  {{- required "REQUIRED: tenant_code" .Values.tenant_code -}}-admin@{{- required "REQUIRED: google.project" .Values.google.project -}}.iam
{{- end -}}


{{- define "bucket" -}}
  {{- required "REQUIRED: app_name" .Values.app_name -}}-ignite-{{- required "REQUIRED: tenant_code" .Values.tenant_code -}}-static
{{- end -}}


{{- define "ip_name" -}}
  {{- required "REQUIRED: app_name" .Values.app_name -}}-ip
{{- end -}}


