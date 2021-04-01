# Kelompok E09
* 05111940000074 - Nur Ahmad Khatim
* 05111940000087 - William Handi Wijaya
* 05111940000212 - Fadhil Dimas Sucahyo
<br><br>

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
<br><br>

# Soal 2
## Info
- Soal ini dikerjakan oleh 05111940000212 - Fadhil Dimas Sucahyo
- Soal ini diminta untuk mendapatkan beberapa kesimpulan dari data penjualan "Laporan-TokoShiSop.tsv"
- Pada awal kode sudah di BEGIN awk dengan Field Seperator dan semua variabel yang dibutuhkan di semua soal
- Semua Fungsi print dimasukkan semua menjadi satu group dibawah pada END dengan input "Laporan-TokoShiSop.tsv" dan output "hasil.txt"

## Penyelesain
### Subsoal a

Pada subsoal ini diminta untuk mencari ID Transaksi yang memiliki Profit Percentage terbesar di data

Untuk no 1 ini kami mendeklarasikan action untuk menghitung profit percentage dan menentukan apakah profit percentage sebuah baris melebihi profit percentage terbesar yang pernah tercatat.

```
{
    rowid=$1;
    sales=$18;
    profit=$21;
    if(rowid != "Row ID" && sales != "Sales" && profit != "Profit")
    {
        costp = sales - profit
        profitp = (profit / costp) * 100
            if(max <= profitp) {
            max = profitp
            rowidmax = rowid
            orderid=$2
            }
    }
```

pada syntax `if(rowid != "Row ID" && sales != "Sales" && profit != "Profit")` berfungsi agar tidak membaca row pertama yang berisi judul baris.

pada syntax `if(max <= profitp) {
            max = profitp
            rowidmax = rowid
            }` berfungsi untuk mengupdate data profit percentage dan Row ID-nya.

pada bagian END bisa diprint
```
print("Transaksi terakhir dengan profit percentage terbesar yaitu " rowidmax " dengan persentase " max "%.\n")
```

dengan hasil output yaitu
```
Transaksi terakhir dengan profit percentage terbesar yaitu 9952 dengan persentase 100%.
```

### Subsoal b

Pada soal ini diminta untuk mencetakkan data costumer yang melakukan transaksi pada tahun 2017 di Albuquerque.

Pada fungsi ini dibutuhkan variabel `orderid` dimana terdapat tahun dari transaksi dan `city` untuk kota transaksi
```
    orderid = $2
    city = $10
    if (orderid != "Order ID" && city != "City")
    {
        year = substr(orderid, 4, 4)
        if (year == 2017 && city == "Albuquerque")
        {
            custname[$7]
        }
    }
```

Pada syntax `year = substr(orderid, 4, 4)` berfungsi untuk mengambil substring dari data `orderid` yaitu dari karakter ke 4 dengan panjang 4 karakter berfungsi untuk mengambil tahun transaksi

Pada syntax `custname[$7]` berfungsi untuk membuat array untuk menampung nama-nama customer yang memenuhi syarat.

lalu pada group END kami print nama-nama yang tersimpan dalam array `custname[$7]`
```
print("Daftar nama customer di Albuquerque pada tahun 2017 antara lain: ")
    for (i in custname)
        print i
```
Hasil output adalah sebagai berikut:
```
Daftar nama customer di Albuquerque pada tahun 2017 antara lain: 
Benjamin Farhat
Michelle Lonsdale
Susan Vittorini
David Wiener
```

### Subsoal C

Pada Subsoal ini diminta untuk mencetakkan segment customer yang memiliki jumlah transaksi yang paling sedikit dan jumlah transaksi segment tersebut.

Pada awal kode sudah dideklarasikan semua variabel untuk segment yaitu `consumer` ,`homeoffice` ,dan `corporate` untuk menampung jumlah transaksi pada segment-segment tersebut. Untuk menghitung jumlah transaksi masing-masing segment kami membuat kode seperti berikut
```
segment = $8
    if (segment != "Segment")
    {
        if (segment == "Consumer")
        {
            consumer++
        }
        else if (segment == "Corporate")
        {
            corporate++
        }
        else if (segment == "Home Office")
        {
            homeoffice++
        }
    }
```
Setelah dihitung semua transaksi masing-masing segment kami bisa menentukan segment apa yang memiliki transaksi paling sedikit yaitu pada grup END terdapat fungsi
```
if (consumer < corporate && consumer < homeoffice)
    {
        totaltranskecil = consumer
        segmentkecil = "Consumer"
    }
    else if (corporate < consumer && corporate < homeoffice)
    {
        totaltranskecil = corporate
        segmentkecil = "Corporate"
    }
    else if (homeoffice < consumer && homeoffice < corporate)
    {
        totaltranskecil = homeoffice
        segmentkecil = "Home Office"
    }
```
Setelah diketahui segment yang memiliki total transaksi terkecil bisa dicetak menggunakan kode sebagai berikut
```
    print("Tipe segmen customer yang penjualannya paling sedikit adalah " segmentkecil " dengan " totaltranskecil " transaksi.\n")
```
Hasil Output adalah sebagai berikut:
```
Tipe segmen customer yang penjualannya paling sedikit adalah Home Office dengan 1783 transaksi.
```

### Subsoal D
Pada soal ini diminta untuk mencari wilayah bagian (region) yang memiliki total keuntungan (profit) paling sedikit dan total keuntungan wilayah tersebut.

Pada group awal sudah di deklarasikan variabel `central`, `east`, `south`, dan `west` untuk menjumlah semua total keuntungan (profit) setiap region. Kode untuk menjumlahkan semua total keuntungan setiap region adalah sebagai berikut
```
 segment = $8
    if (segment != "Segment")
    {
        if (segment == "Consumer")
        {
            consumer++
        }
        else if (segment == "Corporate")
        {
            corporate++
        }
        else if (segment == "Home Office")
        {
            homeoffice++
        }
    }
```
Setelah diketahui semua total keuntungan (profit) setiap region, bisa ditentukan dengan kode pada group END sebagai berikut

```
print("Tipe segmen customer yang penjualannya paling sedikit adalah " segmentkecil " dengan " totaltranskecil " transaksi.\n")
    if (central < east && central < south && central < west)
    {
        terkecil = central
        regionkecil = "Central"
    }
    else if (east < central && east < south && east < west)
    {
        terkecil = east
        regionkecil = "East"
    }
    else if (south < central && south < east && south < west)
    {
        terkecil = south
        regionkecil = "South"
    }
    else if (west < central && west < east && west < south)
    {
        terkecil = west
        regionkecil = "West"
    }
```
Setelah diketahui region mana yang memiliki total keuntungan (profit) paling sedikit, bisa dicetak dengan cara sebagai berikut
```
    print("Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah " regionkecil " dengan total keuntungan " terkecil)
```
Hasil Output adalah sebagai berikut
```
Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah Central dengan total keuntungan 39706.4
```
## Hasil Output
Dari semua subsoal bisa terlihat semua output pada "hasil.txt" yang isinya adalah sebagai berikut
```
Transaksi terakhir dengan profit percentage terbesar yaitu 9952 dengan persentase 100%.

Daftar nama customer di Albuquerque pada tahun 2017 antara lain: 
Benjamin Farhat
Michelle Lonsdale
Susan Vittorini
David Wiener
Tipe segmen customer yang penjualannya paling sedikit adalah Home Office dengan 1783 transaksi.

Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah Central dengan total keuntungan 39706.4

```
<br><br>

# Soal 3 
## Info
* Soal ini dikerjakan oleh 05111940000087 - William Handi Wijaya.  
* Variabel `dir_path` diisi dengan alamat lengkap direktori `soal3`. 
* Variabel `dir_path` terdapat di:
  * cron3a.tab
  * cron3b.tab
  * soal3c.sh
* Berikut ini adalah penjelasan dan penyelesaian dari kelima subsoal dari soal 3.

## Subsoal a
* Hasil gambar dan log disimpan dalam folder di direktori sesuai variabel `dir_path`.
* Nama folder sama dengan waktu pembuatan folder dengan format `DD-MM-YY`.

### Penjelasan Soal
Di soal ini, kami disuruh:
1. unduh 23 gambar dari <https://loremflickr.com/320/240/kitten>
2. simpan log dari pengunduhan di `Foto.log`
3. hapus gambar yang sama hingga tidak ada gambar berduplikat
4. simpan gambar dengan name `Koleksi_XX` secara berurutan
   * contoh: `Koleksi_01`, `Koleksi_02`, ...
  
### Penyelesaian Soal
#### Perintah ke-1 & ke-4
1. Sebanyak 23 kali, jalankan perintah `wget https://loremflickr.com/320/240/kitten`  
   dimana `XX` menandakan banyaknya gambar yang tersimpan dan dimulai dari 1.
2. Increment counter yang menandakan banyaknya gambar yang tersimpan.

#### Perintah ke-2
* Setiap perulangan perintah ke-1, *append* `Foto.log` dengan isi log di terminal.

#### Perintah ke-3
1. Install openimageio-tools dengan perintah `sudo apt install openimageio-tools`.
2. Setiap perintah ke-2 dilaksanakan, lakukan hal berikut setelahnya jika minimal ada satu gambar yang telah tersimpan:
   1. Bandingkan gambar saat ini dengan semua gambar yang telah didownload sebelumnya dengan perintah `idiff <gambar1> <gambar2>`
   2. Jika perintah idiff mengembalikan kata `PASS` (gambar saat ini == gambar sebelumnya)
      * Hapus gambar saat ini
      * Decrement counter yang menandakan banyaknya gambar yang tersimpan.

## Subsoal b
* Hasil gambar dan log disimpan sesuai variabel `dir_path` di script soal3a.sh

### Penjelasan Soal
Di soal ini, kami disuruh:
1. Membuat crontab yang menjalankan soal3a.sh dengan interval:
   * sehari sekali pada jam 8 malam
   * dari tanggal:
      * 1 = tujuh hari sekali (1, 8, ...)
      * 2 = empat hari sekali (2, 6, ...)
2. Memindahkan gambar & lognya ke folder bernama tanggal unduhnya dengan format `DD-MM-YY`.  
   Contoh: `13-03-2023`

### Penyelesaian Soal
#### Perintah 1
1. Tulis isi cron3b.tab di crontab.
2. Di script soal3b.sh, jalankan script soal3a.sh.
   
#### Perintah 2
1. Pindahkan output gambar dan log dari soal3a.sh ke suatu folder di direktori soal3a.sh.
2. Ganti nama folder tersebut sesuai tanggal pembuatan folder dengan format `DD-MM-YY`.

## Subsoal c
* Variabel `dir_path` pada script ini sama dengan variabel `dir_path` pada soal3a.sh.

### Penjelasan Soal
Di soal ini, kami disuruh:
1. Mendonwload gambar kelinci dari <https://loremflickr.com/320/240/bunny>
2. Gambar kelinci dan gambar kucing didownload secara bergantian.
   * Contoh: tanggal 30 kucing > tanggal 31 kelinci > tanggal 1 kucing > ...
3. Berikan nama hewan yang didownload pada nama folder
   > Format: `<Nama hewan>_DD-MM-YYYY`  
   > Contoh: Kucing_13-03-2023

### Penyelesaian Soal
#### Perintah 1
1. Download gambar kelinci dengan perintah `wget https://loremflickr.com/320/240/bunny`
2. Masukan `source soal3c.sh` di script soal3a.sh

#### Perintah 2
1. Scan file dengan nama **Kucing** atau **Kelinci**.
   * Jika tidak ada, download gambar **Kucing**
2. Ambil file terbaru dari file yang terscan.
3. Tentukan nama hewan yang akan didownload berdasarkan nama hewan di file terbaru tersebut.
   * Jika tanggal file terbaru dibuat sama dengan tanggal saat ini, maka hewan yang akan didoawnload sama dengan hewan yang didownload di file terbaru tersebut.
   * Selain itu, jika nama file terbaru sama dengan **Kucing**, maka file yang akan didownload adalah **Kelinci**.
     * Begitupun sebaliknya.
  
#### Perintah 3
1. Kirim nama hewan yang akan didownload ke soal3a.sh dari soal3c.sh
2. Berikan nama folder hasil download sesuai dengan nama hewan dari script soal3c.sh pada soal3a.sh
   * Format: `<Nama hewan>_DD-MM-YYYY`

## Subsoal d
### Penjelasan Soal
Di soal ini, kami disuruh:
1. Zip seluruh folder yang telah didownload kedalam `Koleksi.zip`
2. Atur password dari zip diatas dengan format `MMDDYYYY`
   * Contoh: "03032003"

### Penyelesaian Soal
#### Perintah 1 & 2
* Zip seluruh folder yang telah didownload dengan perintah:
   > `zip -P <tanggal> -rm Koleksi.zip K[eu][lc]in[cg]*`
   dimana tanggal berformat `MMDDYYY` dan merupakan tanggal saat ini.
   >

## Subsoal e
### Penjelasan Soal
Di soal ini, kami disuruh:
1. Membuat jadwal cron yang aktif pada:
   * Hari Senin sampai Jumat pada jam:
      1. 07.00
      2. 18.00
2. Pada jam nomor 1, jalankan script soal3d.sh
3. Pada jam nomor 2:
   1. Unzip file zip
   2. Hapus file zip

### Penyelesaian Soal
* Isi variabel `<dir_path>` di cron3e.tab sesuai dengan alamat lengkap direktori `soal3`

#### Perintah 1
1. Command cron untuk jam pertama adalah: `0 7 * * 1-5`
2. Command cron untuk jam kedua adalah: `0 18 * * 1-5`

#### Perintah 2
* Command cron untuk perintah ini adalah: `0 7 * * 1-5 cd <dir_path> && ./soal3d.sh`

#### Perintah 3
* Jalankan command cron berikut: `0 18 * * 1-5 cd <dir_path> && unzip -P ``date +\%m\%d\%Y`` Koleksi.zip && rm Koleksi.zip`

# Kendala
Kendala dalam pengerjaan adalah sebagai berikut:  
1. Cron untuk soal no 3 tidak jalan karena:  
   1. Permission script tidak diubah.
   2. Lokasi script yang dijalankan cron ternyata salah.
2. Menangani case untuk soal3c ketika melakukan >1 download pada hari yang sama.
