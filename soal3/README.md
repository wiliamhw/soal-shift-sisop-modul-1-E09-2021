# Info
Soal ini dikerjakan oleh 05111940000087 - William Handi Wijaya.  
Berikut ini adalah penjelasan dan penyelesaian dari kelima subsoal dari soal 3.

# Subsoal a
## Penjelasan Soal
Di soal ini, kami disuruh:
1. unduh 23 gambar dari <https://loremflickr.com/320/240/kitten>
2. simpan log dari pengunduhan di `Foto.log`
3. hapus gambar yang sama hingga tidak ada gambar berduplikat
4. simpan gambar dengan name `Koleksi_XX` secara berurutan
   * contoh: `Koleksi_01`, `Koleksi_02`, ...
  
## Penyelesaian
### Perintah ke-1
Sebanyak 23 kali, jalankan perintah  
> `wget -O Koleksi_XX.jpg https://loremflickr.com/320/240/kitten`  
dimana `XX` menandakan banyaknya gambar yang tersimpan.

### Perintah ke-2
Setiap perulangan perintah ke-1, *append* `Foto.log` dengan tulisan:
> `Download gambar ke-<X> pada hari <Hari>, <tanggal> <bulan> <tahun>, pukul <hh:mm:dd> WIB.`  
> 
> Contoh: Download ke-2 gambar pada hari Kamis, 25 Maret 2021, pukul 07:05:44 WIB.  
dimana variabel `X` menandakan banyaknya gambar yang tersimpan

### Perintah ke-3 & ke-4
1. Install openimageio-tools dengan perintah `sudo apt install openimageio-tools`.
2. Setiap perintah ke-2 dilaksanakan, lakukan hal berikut jika minimal ada satu gambar yang telah tersimpan:
   1. Bandingkan gambar saat ini dengan semua gambar yang telah didownload sebelumnya dengan perintah `idiff <gambar1> <gambar2>`
   2. Jika perintah idiff mengembalikan kata `FAILURE` (gambar saat ini == gambar sebelumnya)
      * Hapus gambar saat ini
      * *append* `Foto.log` dengan tulisan:
      * > `Gambar ke-<X> dihapus pada hari <Hari>, <tanggal> <bulan> <tahun>, pukul <hh:mm:dd> WIB karena adanya kesamaan dengan gambar ke-<Y>.`  
        > 
        > Contoh: Gambar ke-2 dihapus pada hari Kamis, 25 Maret 2021, pukul 07:05:59 WIB karena adanya kesamaan dengan gambar ke-1. 
   3. Jika perintah idiff mengembalikan kata `PASS` (gambar saat ini != gambar sebelumnya)
      * Increment counter yang menandakan banyaknya gambar yang tersimpan.