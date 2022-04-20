
{{- define "lifecycle" -}}
  {{- required "REQUIRED: lifecycle" $.Values.lifecycle -}}
{{- end }}


{{- define "tenant_code" -}}
  {{- required "REQUIRED: tenant_code" $.Values.tenant_code -}}
{{- end }}


{{- define "app_code" -}}
  {{- required "REQUIRED: app_code" $.Values.app_code -}}
{{- end }}


{{- define "sa_project_id" -}}
  {{- required "REQUIRED: sa_project_id" $.Values.sa_project_id -}}
{{- end -}}


{{- define "dns_project_id" -}}
  {{- required "REQUIRED: dns_project_id " $.Values.dns_project_id -}}
{{- end -}}


{{- define "gke_project_id" -}}
  {{- required "REQUIRED: gke_project_id" $.Values.gke_project_id -}}
{{- end -}}


{{- define "db_project_id" -}}
  {{- required "REQUIRED: db_project_id " $.Values.db_project_id -}}
{{- end -}}


{{- define "app_project_id" -}}
  {{- required "REQUIRED: app_project_id " $.Values.app_project_id -}}
{{- end -}}


{{- define "apps_admin_sa" -}}
  {{- include "tenant_code" $ -}}-{{- include "app_code" $ -}}-{{- include "lifecycle" $ -}}-admin@{{- include "sa_project_id" $ -}}.iam.gserviceaccount.com
{{- end }}

