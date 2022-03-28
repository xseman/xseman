#!/bin/bash

TEMP="$(mktemp -d)" || exit

for svg in *.svg; do
    rsvg-convert -a -w 20 -f svg "${svg}" -o "${TEMP}/${svg}"
done

for svg in "${TEMP}"/*.svg; do
    echo "Moving ${svg}"
    mv "${svg}" ./
done
