#!/bin/bash

# Get file:// url from clipboard and remove trailing newline
file_url=$(wl-paste | tr -d '\r\n')

# decode url with python
file_path=$(python3 -c "import urllib.parse; u=urllib.parse.urlparse('$file_url'); print(urllib.parse.unquote(u.path))")

echo $file_path

# Exit silently if empty
[[ -z "$file_path" ]] && exit 0

# Exit silently if not a file
[ -f "$file_path" ] || exit 0

# Run PreviewQt with the file
flatpak run org.previewqt.PreviewQt "$file_path" &

exit 0
