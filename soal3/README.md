# Info
* Soal ini dikerjakan oleh 05111940000087 - William Handi Wijaya.  
* Berikut ini adalah penjelasan dan penyelesaian dari kelima subsoal dari soal 3.

# Subsoal a
* Hasil gambar dan log disimpan dalam folder di direktori sesuai variabel `dir_path`.
* Nama folder sama dengan waktu pembuatan folder dengan format `DD-MM-YY`.

## Penjelasan Soal
Di soal ini, kami disuruh:
1. unduh 23 gambar dari <https://loremflickr.com/320/240/kitten>
2. simpan log dari pengunduhan di `Foto.log`
3. hapus gambar yang sama hingga tidak ada gambar berduplikat
4. simpan gambar dengan name `Koleksi_XX` secara berurutan
   * contoh: `Koleksi_01`, `Koleksi_02`, ...
  
## Penyelesaian Soal
### Perintah ke-1 & ke-4
1. Sebanyak 23 kali, jalankan perintah `wget https://loremflickr.com/320/240/kitten`  
   dimana `XX` menandakan banyaknya gambar yang tersimpan dan dimulai dari 1.
2. Increment counter yang menandakan banyaknya gambar yang tersimpan.

### Perintah ke-2
Setiap perulangan perintah ke-1, *append* `Foto.log` dengan tulisan:
> `<Hari>, <tanggal> <bulan> <tahun>, <hh:mm:ss> WIB, download gambar ke-<X>.`  
>
> Contoh: Kamis, 25 Mar 2021, 07:05:44 WIB, download gambar ke-2.  

dimana variabel `X` menandakan banyaknya gambar yang tersimpan

### Perintah ke-3
1. Install openimageio-tools dengan perintah `sudo apt install openimageio-tools`.
2. Setiap perintah ke-2 dilaksanakan, lakukan hal berikut setelahnya jika minimal ada satu gambar yang telah tersimpan:
   1. Bandingkan gambar saat ini dengan semua gambar yang telah didownload sebelumnya dengan perintah `idiff <gambar1> <gambar2>`
   2. Jika perintah idiff mengembalikan kata `PASS` (gambar saat ini == gambar sebelumnya)
      * Hapus gambar saat ini
      * *append* `Foto.log` dengan tulisan:
      * > `<Hari>, <tanggal> <bulan> <tahun>, <hh:mm:ss> WIB, gambar ke-<X> dihapus karena adanya kesamaan dengan gambar ke-<Y>.`  
        > 
        > Contoh: Kamis, 25 Mar 2021, 07:05:59 WIB, gambar ke-2 dihapus karena adanya kesamaan dengan gambar ke-1. 
      * Decrement counter yang menandakan banyaknya gambar yang tersimpan.


# Subsoal b
* Hasil gambar dan log disimpan sesuai variabel `dir_path` di script soal3a.sh
* Berikan alamat dari direktori tempat script 3a berada pada variabel `curr_path` di script soal3b.sh.
* Jika cron tidak jalan, coba berikan permission untuk soal3a.sh dan soal3b.sh dengan perintah `chmod +x <nama script>.sh`.

## Penjelasan Soal
Di soal ini, kami disuruh:
1. Membuat crontab yang menjalankan soal3a.sh dengan interval:
   * sehari sekali pada jam 8 malam
   * dari tanggal:
      * 1 = tujuh hari sekali (1, 8, ...)
      * 2 = empat hari sekali (2, 6, ...)
2. Memindahkan gambar & lognya ke folder bernama tanggal unduhnya dengan format `DD-MM-YY`.  
   Contoh: `13-03-2023`

## Penyelesaian Soal
### Perintah 1
1. Ganti `<curr directory path>` di cron3b.tab sesuai alamat folder soal3.
2. Tulis isi cron3b.tab di crontab.
3. Di script soal3b.sh, jalankan script soal3a.sh bila tanggal saat ini memenuhi interval pada soal.

### Perintah 2
1. Pindahkan output gambar dan log dari soal3a.sh ke suatu folder di direktori soal3a.sh.
2. Ganti nama folder tersebut sesuai tanggal pembuatan folder dengan format `DD-MM-YY`.


# Subsoal c
* Variabel `dir_path` pada script ini harus sama dengan variabel `dir_path` pada soal 3a.

## Penjelasan Soal
Di soal ini, kami disuruh:
1. Mendonwload gambar kelinci dari <https://loremflickr.com/320/240/bunny>
2. Gambar kelinci dan gambar kucing didownload secara bergantian.
   * Contoh: tanggal 30 kucing > tanggal 31 kucing > tanggal 1 kucing > ...
3. Berikan nama hewan yang didownload pada nama folder
   > Format: `<Nama hewan>_DD-MM-YYYY`  
   > Contoh: Kucing_13-03-2023

## Penyelesaian Soal
### Perintah 1
* Download gambar kelinci dengan perintah `wget https://loremflickr.com/320/240/bunny`

### Perintah 2
1. Scan file dengan nama **Kucing** atau **Kelinci**.
   * Jika tidak ada, download gambar **Kucing**
2. Ambil file terbaru dari file yang terscan.
3. Tentukan nama hewan yang akan didownload berdasarkan nama hewan di file terbaru tersebut.
   * Jika nama file terbaru sama dengan **Kucing**, maka file yang akan didownload adalah **Kelinci**.
   * Begitupun sebaliknya.

### Perintah 3
1. Download hewan yang terpilih dari perintah 2
2. Berikan nama folder hasil download sesuai dengan nama hewan