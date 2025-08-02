#!/bin/bash

# Get file path from clipboard and strip file:// prefix
file_path=$(wl-paste | sed 's|^file://||' | tr -d '\r\n')

# Exit silently if empty
[[ -z "$file_path" ]] && exit 0

# Exit silently if not a file
[ -f "$file_path" ] || exit 0

# Run PreviewQt with the file
flatpak run org.previewqt.PreviewQt "$file_path" &

exit 0
