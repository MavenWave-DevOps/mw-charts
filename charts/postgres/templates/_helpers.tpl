
{{- define "infra_sa" -}}
  {{- if .Values.config_connector.context.enabled }}
    {{- required "REQUIRED: infra_sa" .Values.infra_sa -}}
  {{- else }}
    {{- "" }}
  {{- end }}
{{- end -}}

