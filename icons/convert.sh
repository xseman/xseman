#!/bin/bash

ls *.svg | xargs -I{} -t rsvg-convert -a -w 20 -f svg '{}' -o '_{}'
ls _*.svg | xargs -I{} bash -c 'mv "$1" "${1:1}"' -- {}
