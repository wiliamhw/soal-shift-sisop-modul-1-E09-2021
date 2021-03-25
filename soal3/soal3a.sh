#!/bin/bash

username='frain8' # Store the username of local Linux environtment
limit=23

for ((i=0, dc=0; i < $limit; i++)); do # dc = downloaded file counter
    # Download pictures
    name="$((++dc))"
    if [ $name -lt 10 ]; then
        name="0$name"
    fi
    echo "`wget -O Koleksi_$name.jpg https://loremflickr.com/320/240/kitten`"

    # Write to log
    _date="$(date +"%A, %d %b %Y, %T WIB")" # Example: Kamis, 25 Mar 2021, 07:05:44 WIB
    echo "$_date, download gambar ke-$dc." >> /home/"$username"/log/Foto.log

    # Compare current image with all of the previous downloaded images
    if [ $i -gt 1 ]; then # Start when at least 1 file is alredy downloaded
        for ((j=0; j < dc-1; j++)); do
            # Add 0 if j is lower than 10
            temp="$((j + 1))"
            if [ $temp -lt 10 ]; then
                jname="0$temp"
            fi

            # Compare downloaded image with previous image
            cmp="$(idiff "Koleksi_$jname.jpg" "Koleksi_$name.jpg")"
            cmp=$(awk -F " " '/PASS/ {print($1)}' <<< $cmp) # If current image is the same as previous image, this var will be empty

            # Delete image if the same image is already downloaded
            if [ -n "$cmp" ]; then
                echo `rm Koleksi_"$name".jpg` # Delete image

                # Write to log
                _date="$(date +"%A, %d %b %Y, %T WIB")" # Example: Kamis, 25 Mar 2021, 07:05:44 WIB
                echo "$_date, gambar ke-$dc dihapus karena adanya kesamaan dengan gambar ke-$temp." >> /home/"$username"/log/Foto.log

                ((dc--)) # Decrement downloaded file counter
                break
            fi
        done
    fi
done