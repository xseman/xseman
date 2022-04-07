#!/bin/bash

for cmd in {rsvg-convert,}; do
    if ! command -v "${cmd}" > /dev/null; then
        echo "This script requires '${cmd}' to be installed."
        exit 1
    fi
done

TEMP="$(mktemp -d)" || exit

for svg in *.svg; do
    rsvg-convert -a -w 20 -f svg "${svg}" -o "${TEMP}/${svg}"
done

for svg in "${TEMP}"/*.svg; do
    echo "Moving ${svg}"
    mv "${svg}" ./
done
