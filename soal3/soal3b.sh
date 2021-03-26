#!/bin/bash
curr_day="$(date +"%d")"

if [ $(( ($curr_day-1) % 7 )) -eq 0 || $(( ($curr_day-2) % 4 )) -eq 0 ]; then
    echo "`./soal3a.sh`"
fi
# echo "`./soal3a.sh`" # For debugging purpose