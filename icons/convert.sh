#!/bin/bash

for cmd in {rsvg-convert,}; do
    if ! command -v "${cmd}" > /dev/null; then
        echo "This script requires '${cmd}' to be installed."
        exit 1
    fi
done

cd "$(dirname "$0")" || exit 1

TEMP="$(mktemp -d)" || exit

for svg in *.svg; do
    rsvg-convert -a -w 22 -h 22 -f svg "${svg}" -o "${TEMP}/${svg}"
done

for svg in "${TEMP}"/*.svg; do
    echo "Moving ${svg}"
    mv "${svg}" ./
done
