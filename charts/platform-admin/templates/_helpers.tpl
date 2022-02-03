

{{- define "lifecycle_letter" -}}
  {{- substr 0 1 .Values.lifecycle -}}
{{- end }}


{{- define "gke_project_id" -}}
  {{ include "lifecycle_letter" . }}-{{ required "REQURIED: platform_label" .Values.platform_label }}-gke-project-{{ required "REQUIRED: gke_project_suffix" .Values.gke_project_suffix }}
{{- end }}


{{- define "infra_admin_sa" -}}
  {{- required "REQUIRED: lifecycle" .Values.lifecycle }}-tenant-cpl@{{- required "REQUIRED: sa_project" .Values.sa_project -}}.iam.gserviceaccount.com
{{- end }}

