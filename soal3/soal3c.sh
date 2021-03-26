#!/bin/bash

dir_path='/home/frain8/Documents/Sisop/Modul_1/soal_shift1/soal3'

_newest_date=1000-12-30 # Variable to store newest date
_now="$(date +"%Y-%m-%d")" # Variable to store today's date
curr_ls="`ls $dir_path`" # Variable to store list of all files in current directory

currAnimal=$(awk -F "_" -v newest_date="$_newest_date" -v now="$_now" '
    BEGIN {
        animal_name = "Kelinci"
        swap = "True"
    } /Kucing|Kelinci/ {
        split($2, date, "-");
        curr_date = date[3]"-"date[2]"-"date[1]

        # Get animal name of newest folder
        if (curr_date >= newest_date) {
            animal_name = $1
            if (curr_date > newest_date) newest_date = curr_date
            if (curr_date == now) swap = "False" # Preserve animal name if curr_date == now
        }
    } END {
        if (swap == "True") {
            animal_name = (animal_name == "Kucing") ? "Kelinci" : "Kucing"
        }
        print animal_name
    }
' <<< $curr_ls ) 