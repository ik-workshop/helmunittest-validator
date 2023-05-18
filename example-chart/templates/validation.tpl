{{/*
Validate chart name to start with notfailing-.
*/}}
{{- if not (regexMatch "(^notfailing($|-.*)$)" .Chart.Name ) -}}
  {{ fail "Chart should start with 'notfailing-'" }}
{{- end -}}