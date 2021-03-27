# Notif
* push ke branch soal masing-masing ya :)

# Kelompok E09
* 05111940000074 - Nur Ahmad Khatim
* 05111940000087 - William Handi Wijaya
* 05111940000212 - Fadhil Dimas Sucahyo
<br><br>

# Soal 1
## Info
* Soal ini dikerjakan oleh 05111940000074 - Nur Ahmad Khatim.  

# Soal 2
## Info
* Soal ini dikerjakan oleh 05111940000212 - Fadhil Dimas Sucahyo.  

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
2. Di script soal3b.sh, jalankan script soal3a.sh bila tanggal saat ini memenuhi interval pada soal.
   
#### Perintah 2
1. Pindahkan output gambar dan log dari soal3a.sh ke suatu folder di direktori soal3a.sh.
2. Ganti nama folder tersebut sesuai tanggal pembuatan folder dengan format `DD-MM-YY`.

## Subsoal c
* Variabel `dir_path` pada script ini sama dengan variabel `dir_path` pada soal3a.sh.

### Penjelasan Soal
Di soal ini, kami disuruh:
1. Mendonwload gambar kelinci dari <https://loremflickr.com/320/240/bunny>
2. Gambar kelinci dan gambar kucing didownload secara bergantian.
   * Contoh: tanggal 30 kucing > tanggal 31 kucing > tanggal 1 kucing > ...
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