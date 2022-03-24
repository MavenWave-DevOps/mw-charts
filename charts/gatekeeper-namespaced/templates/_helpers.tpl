{{- define "external_ip" -}}

  {{- if .Values.lifecycle_letter }}
    {{- if eq .Values.lifecycle_letter "d" }}
      {{- if .Values.d_external_ip}}
        {{- .Values.d_external_ip }}
      {{- end }}

    {{- else if eq .Values.lifecycle_letter "t" }}
      {{- if .Values.t_external_ip }}
        {{- .Values.t_external_ip }}
      {{- end }}

    {{- else if eq .Values.lifecycle_letter "s" }}
      {{- if .Values.s_external_ip }}
        {{- .Values.s_external_ip }}
      {{- end }}

    {{- else if eq .Values.lifecycle_letter "p" }}
      {{- if .Values.p_external_ip }}
        {{- .Values.p_external_ip }}
      {{- end }}

    {{- end }}
  {{- end }}

{{- end }}




