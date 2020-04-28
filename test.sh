#!/bin/bash

set -e

echo Check TheLounge version
docker exec thelounge thelounge --version | grep --color=never -E "^v[0-9]\.[0-9]\.[0-9]" | cut -c 2- | grep -f /dev/stdin /Dockerfile

echo Check HTML output
curl -sL thelounge:9000 | grep "<title>The Lounge</title>"

echo Check for config.js to be created in the mounted host system directory
stat "${mount_dir}/config.js"

echo Logs
docker logs thelounge
