# Soal 1
## Info
* Diselesaikan oleh 05111940000074 - Nur Ahmad Khatim.
## Persoalan
* Membuat laporan **daftar peringkat pesan error** terbanyak dan laporan **penggunaan user** pada aplikasi *ticky* tanpa menggunakan AWK.
## Penyelesaian
* Subsoal a
```
printf 'Informasi Jenis Log, Pesan Log, dan Username :\n'
cat syslog.log | cut -f6- -d' '
printf '\n'
```
Mengumpulkan informasi dari file `syslog.log` dengan format yang diperlukan : `<log_type> <log_message> (<username>)`.
1. `cat syslog.log` digunakan untuk mengambil isi dari file `syslog.log`.
2. `cut -f6- -d' '` digunakan untuk memotong isi dari file yang diambil dengan rentang mulai field ke-6 yaitu jenis log dan seterusnya sampai username yang ditentukan dengan batasan (spasi).

Hasil yang ditampilkan pada terminal :
```
Informasi Jenis Log, Pesan Log, dan Username :
INFO Created ticket [#4217] (mdouglas)
INFO Closed ticket [#1754] (noel)
ERROR The ticket was modified while updating (breee)
ERROR Permission denied while closing ticket (ac)
INFO Commented on ticket [#4709] (blossom)
INFO Commented on ticket [#6518] (rr.robinson)
ERROR Tried to add information to closed ticket (mcintosh)
ERROR Tried to add information to closed ticket (jackowens)
ERROR Tried to add information to closed ticket (mdouglas)
ERROR Timeout while retrieving information (oren)
ERROR Ticket doesn't exist (xlg)
ERROR Timeout while retrieving information (ahmed.miller)
ERROR Ticket doesn't exist (blossom)
ERROR The ticket was modified while updating (bpacheco)
ERROR Ticket doesn't exist (enim.non)
ERROR Permission denied while closing ticket (rr.robinson)
ERROR Tried to add information to closed ticket (oren)
ERROR Timeout while retrieving information (mcintosh)
ERROR Timeout while retrieving information (ahmed.miller)
ERROR Connection to DB failed (jackowens)
ERROR Permission denied while closing ticket (flavia)
ERROR Tried to add information to closed ticket (oren)
ERROR Tried to add information to closed ticket (sri)
INFO Commented on ticket [#1097] (breee)
ERROR Connection to DB failed (nonummy)
INFO Created ticket [#7115] (noel)
ERROR The ticket was modified while updating (flavia)
INFO Commented on ticket [#2253] (nonummy)
ERROR Connection to DB failed (oren)
ERROR Timeout while retrieving information (xlg)
INFO Created ticket [#7298] (ahmed.miller)
ERROR Timeout while retrieving information (flavia)
ERROR Connection to DB failed (jackowens)
INFO Commented on ticket [#7255] (oren)
ERROR Ticket doesn't exist (flavia)
ERROR Tried to add information to closed ticket (jackowens)
INFO Closed ticket [#1712] (britanni)
INFO Created ticket [#2860] (mcintosh)
ERROR Timeout while retrieving information (montanap)
ERROR Permission denied while closing ticket (britanni)
ERROR Permission denied while closing ticket (montanap)
ERROR Tried to add information to closed ticket (noel)
ERROR Timeout while retrieving information (oren)
INFO Commented on ticket [#8385] (mdouglas)
INFO Closed ticket [#2452] (jackowens)
ERROR Connection to DB failed (ac)
ERROR Timeout while retrieving information (blossom)
ERROR Permission denied while closing ticket (montanap)
ERROR Tried to add information to closed ticket (breee)
ERROR Connection to DB failed (sri)
ERROR Timeout while retrieving information (montanap)
ERROR Permission denied while closing ticket (ahmed.miller)
ERROR Connection to DB failed (mai.hendrix)
INFO Commented on ticket [#4562] (ac)
ERROR Tried to add information to closed ticket (ahmed.miller)
INFO Created ticket [#7897] (kirknixon)
ERROR Permission denied while closing ticket (mai.hendrix)
ERROR Connection to DB failed (kirknixon)
ERROR Ticket doesn't exist (flavia)
INFO Created ticket [#5784] (sri)
ERROR Permission denied while closing ticket (blossom)
ERROR Tried to add information to closed ticket (nonummy)
INFO Closed ticket [#8685] (rr.robinson)
ERROR The ticket was modified while updating (breee)
INFO Commented on ticket [#4225] (noel)
ERROR The ticket was modified while updating (enim.non)
ERROR Timeout while retrieving information (xlg)
INFO Closed ticket [#7948] (noel)
INFO Commented on ticket [#8628] (noel)
ERROR Tried to add information to closed ticket (noel)
ERROR Ticket doesn't exist (blossom)
ERROR Permission denied while closing ticket (enim.non)
INFO Closed ticket [#7333] (enim.non)
INFO Commented on ticket [#1653] (noel)
ERROR The ticket was modified while updating (mdouglas)
INFO Created ticket [#5455] (ac)
ERROR Timeout while retrieving information (oren)
INFO Commented on ticket [#3813] (mcintosh)
ERROR Connection to DB failed (bpacheco)
ERROR The ticket was modified while updating (mcintosh)
ERROR Connection to DB failed (oren)
INFO Closed ticket [#8604] (mcintosh)
ERROR The ticket was modified while updating (noel)
ERROR Ticket doesn't exist (nonummy)
ERROR Timeout while retrieving information (blossom)
ERROR Timeout while retrieving information (mai.hendrix)
INFO Created ticket [#6361] (enim.non)
ERROR Timeout while retrieving information (xlg)
INFO Commented on ticket [#7159] (ahmed.miller)
ERROR Connection to DB failed (breee)
INFO Created ticket [#7737] (nonummy)
ERROR Connection to DB failed (mdouglas)
INFO Closed ticket [#4372] (oren)
INFO Commented on ticket [#2389] (sri)
ERROR Connection to DB failed (breee)
INFO Closed ticket [#3297] (kirknixon)
ERROR The ticket was modified while updating (blossom)
INFO Created ticket [#2461] (jackowens)
INFO Closed ticket [#9876] (blossom)
INFO Created ticket [#5896] (mcintosh)

```
* Subsoal b
```
printf 'Jumlah Kemunculan setiap Pesan ERROR :\n'
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c
printf '\n'
```
Menampilkan semua pesan error yang muncul beserta jumlah kemunculannya.
1. `grep "ERROR"` digunakan untuk mencari baris pada file `syslog.log` yang memiliki kata `ERROR`.
2. `cut -d' ' -f7- | cut -d'(' -f1` digunakan untuk memotong isi dari file mulai dari field yang mengandung pesan dari error dan mengabaikan usernamenya.
3. `sort | uniq -c` digunakan untuk mengurutkan pesan berdasarkan ASCIInya yang kemudian hanya mengambil sekali untuk line berurutan yang isinya sama dan menghitung banyak line yang sama tersebut.

Hasil yang ditampilkan pada terminal :
```
Jumlah Kemunculan setiap Pesan ERROR :
     13 Connection to DB failed 
     10 Permission denied while closing ticket 
      9 The ticket was modified while updating 
      7 Ticket doesn't exist 
     15 Timeout while retrieving information 
     12 Tried to add information to closed ticket 

```
* Subsoal c
```
printf 'Jumlah Kemunculan LOG ERROR setiap User :\n'
cat syslog.log | grep "ERROR" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c
printf 'Jumlah Kemunculan LOG INFO setiap User :\n'
cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c
printf '\n'
```
Menampilkan jumlah kemunculan log `ERROR` dan `INFO` untuk setiap user.
1. `grep "ERROR" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c` digunakan untuk mengambil isi dari file yang memiliki kata ERROR dan hanya menampilkan field yang terdapat di antara '(' dan ')' kemudian diurutkan berdasarkan abjab nama usernya dilanjutkan dengan menghitung jumlah kemunculan usernya sebagai banyak error yang dimiliki user tersebut.
2. Hal yang sama digunakan pada nomor 1 tapi untuk baris yang memiliki kata INFO

Hasil yang ditampilkan pada terminal :
```
Jumlah Kemunculan LOG ERROR setiap User :
      2 ac
      4 ahmed.miller
      6 blossom
      2 bpacheco
      5 breee
      1 britanni
      3 enim.non
      5 flavia
      4 jackowens
      1 kirknixon
      3 mai.hendrix
      3 mcintosh
      3 mdouglas
      4 montanap
      3 noel
      3 nonummy
      7 oren
      1 rr.robinson
      2 sri
      4 xlg
Jumlah Kemunculan LOG INFO setiap User :
      2 ac
      2 ahmed.miller
      2 blossom
      1 breee
      1 britanni
      2 enim.non
      2 jackowens
      2 kirknixon
      4 mcintosh
      2 mdouglas
      6 noel
      2 nonummy
      2 oren
      2 rr.robinson
      2 sri

```
* Subsoal d
```
printf 'Error , Count\n' > error_message.csv
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | grep -Eo '[0-9]{1,}' > count.csv
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > message.csv

paste message.csv count.csv | while IFS="$(printf '\t')" read -r f1 f2
do
    printf "$f1, $f2\n"
done >> error_message.csv

rm message.csv
rm count.csv
```
Informasi yang didapatkan pada Subsoal b dituliskan ke dalam file `error_message.csv` dengan header `Error , Count` kemudian isi pesan errornya diurutkan berdasarkan jumlah kemunculannya dari yang terbanyak.
1. Menuliskan headernya ke dalam file `error_message.csv` dengan perintah `printf`.
2. Mencetak jumlah kemunculan tiap pesan error ke dalam file sementara yang dibuat dengan nama `count.csv` yang hanya berisi angka.
3. Mencetak isi pesan error ke dalam file sementara `message.csv`dengan menghapus isi file yang berisi angka dan (spasi) di awal baris, akan hanya berisi text pesan errornya.
4. Melakukan looping untuk mencetak ke dalam file `error_message.csv` dengan format <log_message> , <jumlah_kemunculan>.
5. Menghapus semua file sementara yang digunakan.

Isi dari file `error_message.csv` :
```
Error , Count
Timeout while retrieving information , 15
Connection to DB failed , 13
Tried to add information to closed ticket , 12
Permission denied while closing ticket , 10
The ticket was modified while updating , 9
Ticket doesn't exist , 7

```
* Subsoal e
```
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
```
Informasi yang didapatkan pada Subsoal c dituliskan ke dalam file `user_statistic.csv` dengan header `Username,INFO,ERROR` diurutkan berdasarkan username secara **ascending**
1. Passing data yang hanya berisi username yang telah diurutkan ascending ke dalam file sementara `user_name.csv`.
2. Passing data yang hanya berisi jumlah error yang dimiliki setiap user ke dalam file sementara `user_errorcount.csv`.
3. Passing data yang hanya berisi username yang memiliki error ke dalam file seemntara `user_errorname.csv`.
4. Sama seperti ERROR, dilakukan juga pada INFO untuk file sementara `user_infocount.csv` dan `user_infoname.csv`.
5. Melakukan nested looping untuk mengecek dan membandingkan username pada file `user_name.csv` dengan file `user_infoname.csv` dan `user_errorname.csv`. Jika barisnya memiliki data atau string yang sama, variabel yang menyimpan jumlah info dan error tiap user akan diupdate sesuai yang terdapat pada file `user_infocount.csv` dan `user_errorcount.csv`.
6. Mencetak hasil pengecekan ke dalam file `user_statistic.csv` dengan format <username>,<jumlah_info>,<jumlah_error>.
7. Menghapus semua file sementara yang digunakan.

Isi dari file `user_statistic.csv` :
```
Username,INFO,ERROR
ac,2,2
ahmed.miller,2,4
blossom,2,6
bpacheco,0,2
breee,1,5
britanni,1,1
enim.non,2,3
flavia,0,5
jackowens,2,4
kirknixon,2,1
mai.hendrix,0,3
mcintosh,4,3
mdouglas,2,3
montanap,0,4
noel,6,3
nonummy,2,3
oren,2,7
rr.robinson,2,1
sri,2,2
xlg,0,4

```
