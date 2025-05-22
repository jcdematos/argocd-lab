{{- define "bootstrap.renderSyncPolicy" -}}
    {{- $sync := index . 0 }}
    {{- with $sync }}
      {{- if and .enabled .syncPolicy }}
{{ toYaml .syncPolicy | indent 4 }}
      {{- end }}
    {{- end }}
{{- end }}

