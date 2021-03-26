#!/bin/bash

#a
printf 'Informasi Jenis Log, Pesan Log, dan Username :\n'
cat syslog.log | cut -f6- -d' '
printf '\n'

#b
printf 'Jumlah Kemunculan setiap Pesan ERROR :\n'
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c
printf '\n'

#c
printf 'Jumlah Kemunculan LOG ERROR setiap User :\n'
cat syslog.log | grep "ERROR" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c
printf 'Jumlah Kemunculan LOG INFO setiap User :\n'
cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c
printf '\n'

#d
printf 'Error , Count\n' > error_message.csv
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | grep -Eo '[0-9]{1,}' > count.csv
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > message.csv

paste message.csv count.csv | while IFS="$(printf '\t')" read -r f1 f2
do
    printf "$f1, $f2\n"
done >> error_message.csv

rm message.csv
rm count.csv

#e
printf 'Username,INFO,ERROR\n' > user_statistic.csv
cat syslog.log | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > user_name.csv
cat syslog.log | grep "ERROR" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | grep -Eo '[0-9]{1,}' > user_errorcount.csv
cat syslog.log | grep "ERROR" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > user_errorname.csv
cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | grep -Eo '[0-9]{1,}' > user_infocount.csv
cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > user_infoname.csv

while read username; do
    nameuser="$username"
    infouser=0
    erroruser=0
    paste user_infocount.csv user_infoname.csv | (while read infocount infoname; do
        if [ "$nameuser" == "$infoname" ]
        then
            infouser=$infocount
            break
        fi
    done
    paste user_errorcount.csv user_errorname.csv | (while read errorcount errorname; do
        if [ "$nameuser" == "$errorname" ]
        then
            erroruser=$errorcount
            break
        fi
    done
    printf "$nameuser,$infouser,$erroruser\n" >> user_statistic.csv))
done < user_name.csv

rm user_name.csv
rm user_errorcount.csv
rm user_errorname.csv
rm user_infocount.csv
rm user_infoname.csv