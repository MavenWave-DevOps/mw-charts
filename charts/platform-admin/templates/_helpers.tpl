

{{- define "lifecycle_letter" -}}
  {{- substr 0 1 .Values.lifecycle -}}
{{- end }}


{{- define "sa_project_id" -}}
  {{- if .Values.sa_project_id }}
    {{- .Values.sa_project_id }}
  {{- else }}
    {{- include "lifecycle_letter" . }}-{{ required "REQURIED: platform_label" .Values.platform_label }}-sa-project-{{ required "REQUIRED: sa_project_suffix" .Values.sa_project_suffix }}
  {{- end }}
{{- end }}


{{- define "dns_project_id" -}}
  {{- if .Values.dns_project_id }}
    {{- .Values.dns_project_id }}
  {{- else }}
    {{- include "lifecycle_letter" . }}-{{ required "REQURIED: platform_label" .Values.platform_label }}-dns-project-{{ required "REQUIRED: dns_project_suffix" .Values.dns_project_suffix }}
  {{- end }}
{{- end }}


{{- define "gke_project_id" -}}
  {{- if .Values.gke_project_id }}
    {{- .Values.gke_project_id }}
  {{- else }}
    {{- include "lifecycle_letter" . }}-{{ required "REQURIED: platform_label" .Values.platform_label }}-gke-project-{{ required "REQUIRED: gke_project_suffix" .Values.gke_project_suffix }}
  {{- end }}
{{- end }}


{{- define "infra_admin_sa" -}}
  {{- required "REQUIRED: lifecycle" .Values.lifecycle }}-tenant-cpl@{{- include "sa_project_id" . -}}.iam.gserviceaccount.com
{{- end }}

