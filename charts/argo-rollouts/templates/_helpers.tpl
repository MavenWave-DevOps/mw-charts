
{{- define "domain" -}}
  {{- required "REQUIRED: domain" $.Values.domain -}}
{{- end }}


{{- define "rollouts_sa" -}}
  {{- required "REQUIRED: rollouts_sa" $.Values.rollouts_sa -}}
{{- end }}


{{- define "gke_project_id" -}}
  {{- required "REQUIRED: gke_project_id" $.Values.gke_project_id -}}
{{- end }}



