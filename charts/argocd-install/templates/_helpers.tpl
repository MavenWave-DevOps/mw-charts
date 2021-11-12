

{{- define "domain" -}}

  {{- if .Values.lifecycle }}

    {{- if eq .Values.lifecycle "prod" }}
      {{- required "ArgoCD Domain Required" .Values.domain }}

    {{- else }}
      {{- .Values.lifecycle -}}.{{- required "ArgoCD Domain Required" .Values.domain }}

    {{- end -}}

  {{- else }}
    {{- required "ArgoCD Domain Required" .Values.domain }}
  {{- end -}}

{{- end }}
