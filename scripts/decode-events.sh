#!/bin/sh

if [ -f "${1}" ]; then
  didc decode `cat ${1}` -d .dfx/local/canisters/MirrorGarden/MirrorGarden.did -t '(vec EventInfo)'
else
    echo "Error within ${0}: File not found:"
    echo " - Could not find event file ${1}"
    echo
    echo "usage: ${0} <icmt-events-filename>"
fi
