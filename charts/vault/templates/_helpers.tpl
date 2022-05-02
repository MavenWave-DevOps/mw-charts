
{{- define "domain" -}}
  {{- required "REQUIRED: domain" $.Values.domain -}}
{{- end }}


{{- define "ip_admin_sa" -}}
  {{- required "REQUIRED: ip_admin_sa" $.Values.ip_admin_sa -}}
{{- end }}


{{- define "gke_project_id" -}}
  {{- required "REQUIRED: gke_project_id" $.Values.gke_project_id -}}
{{- end }}


{{- define "sa_project_id" -}}
  {{- required "REQUIRED: sa_project_id" $.Values.sa_project_id -}}
{{- end }}


