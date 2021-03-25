# Info
* Soal ini dikerjakan oleh 05111940000087 - William Handi Wijaya.  
* Berikut ini adalah penjelasan dan penyelesaian dari kelima subsoal dari soal 3.

# Subsoal a
* File `Foto.log` disimpan di `/home/<username>/log/Foto.log`, dimana `username` adalah username dari local Linux environtment. 

## Penjelasan Soal
Di soal ini, kami disuruh:
1. unduh 23 gambar dari <https://loremflickr.com/320/240/kitten>
2. simpan log dari pengunduhan di `Foto.log`
3. hapus gambar yang sama hingga tidak ada gambar berduplikat
4. simpan gambar dengan name `Koleksi_XX` secara berurutan
   * contoh: `Koleksi_01`, `Koleksi_02`, ...
  
## Penyelesaian Soal
### Perintah ke-1 & ke-4
1. Sebanyak 23 kali, jalankan perintah  
   > `wget -O Koleksi_XX.jpg https://loremflickr.com/320/240/kitten`  

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
* Buat dua baris cron command pada crontab yang menjalankan soal3a.sh.  
* Berikut ini adalah command untuk penjadwalan cron yang akan dijalankan sehari sekali pada jam 8 malam:
   * dari tanggal 1 & tujuh hari sekali: `0 22 1/7 * *`
   * dari tanggal 2 & empat hari sekali: `0 22 2/4 * *`

### Perintah 2
1. Pindahkan output gambar dan log dari soal3a.sh ke suatu folder di current directory.
2. Ganti nama folder tersebut sesuai tanggal pembuatan folder dengan format `DD-MM-YY`.
