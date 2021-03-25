# Info
* Soal ini dikerjakan oleh 05111940000087 - William Handi Wijaya.  
* File `Foto.log` disimpan di `/home/<username>/log/Foto.log`, dimana `username` adalah username dari local Linux environtment.  
* Berikut ini adalah penjelasan dan penyelesaian dari kelima subsoal dari soal 3.

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

### Perintah ke-3 & ke-4
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