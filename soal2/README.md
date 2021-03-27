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
