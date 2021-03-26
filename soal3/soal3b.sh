#!/bin/bash
curr_path='/home/frain8/Documents/Sisop/Modul_1/soal_shift1/soal3'
curr_day="$(date +"%d")"

if [ $(( ($curr_day-1) % 7 )) -eq 0 || $(( ($curr_day-2) % 4 )) -eq 0 ]; then
    echo "`$curr_path/soal3a.sh`"
fi
# echo "`$curr_path/soal3a.sh`" # For debugging purpose