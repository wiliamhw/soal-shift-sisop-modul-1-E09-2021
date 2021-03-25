#!/bin/bash

dir_path='/home/frain8/Documents/Sisop/Modul_1/soal_shift1/soal3'
folder_path="$dir_path/$(date +"%d-%m-%Y")"
limit=23

# Create folder if folder_path not exist
if [ ! -d $folder_path ]; then
    echo "`mkdir $folder_path`"
fi

for ((i=0, dc=0; i < $limit; i++)); do # dc = downloaded file counter
    # Download pictures
    name="$((++dc))"
    if [ $name -lt 10 ]; then
        name="0$name"
    fi
    echo "`wget -nv -O $folder_path/Koleksi_$name.jpg https://loremflickr.com/320/240/kitten`"

    # Write to log
    _date="$(date +"%A, %d %b %Y, %T WIB")" # Example: Kamis, 25 Mar 2021, 07:05:44 WIB
    echo "$_date, download gambar ke-$dc." >> "$folder_path/Foto.log"

    # Compare current image with all of the previous downloaded images
    if [ $i -gt 1 ]; then # Start when at least 1 file is alredy downloaded
        for ((j=0; j < dc-1; j++)); do
            # Add 0 if j is lower than 10
            temp="$((j + 1))"
            if [ $temp -lt 10 ]; then
                jname="0$temp"
            fi

            # Compare downloaded image with previous image
            cmp="$(idiff "$folder_path/Koleksi_$jname.jpg" "$folder_path/Koleksi_$name.jpg")"
            cmp=$(awk -F " " '/PASS/ {print($1)}' <<< $cmp) # If current image is the same as previous image, this var will be empty

            # Delete image if the same image is already downloaded
            if [ -n "$cmp" ]; then
                echo "`rm $folder_path/Koleksi_$name.jpg`" # Delete image

                # Write to log
                _date="$(date +"%A, %d %b %Y, %T WIB")" # Example: Kamis, 25 Mar 2021, 07:05:44 WIB
                echo "$_date, gambar ke-$dc dihapus karena adanya kesamaan dengan gambar ke-$temp." >> "$folder_path/Foto.log"

                ((dc--)) # Decrement downloaded file counter
                break
            fi
        done
    fi
done