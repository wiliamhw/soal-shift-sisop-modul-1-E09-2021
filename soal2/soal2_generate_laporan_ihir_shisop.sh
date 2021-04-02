#!/bin/bash

awk '
BEGIN {FS="\t"}

{
    if (NR != 1){
    profitp = ($21 / ($18-$21)) * 100
    if(max <= profitp) {max = profitp; rowidmax = $1;}
    }

    if (NR != 1)
    {
        if ($2~2017 && $10 == "Albuquerque"){name[$7]}
    }
    if (NR != 1)
    {
        if ($8 == "Consumer") {consumer++}
        else if ($8 == "Corporate") {corporate++}
        else if ($8 == "Home Office") {homeoffice++}
    }
    if (NR != 1)
    {
        if ($13 == "Central"){central += $21}
        else if ($13 == "East"){east += $21}
        else if ($13 == "South"){south += $21}
        else if ($13 == "West"){west += $21}
    }
}

END{
    print("Transaksi terakhir dengan profit percentage terbesar yaitu " rowidmax " dengan persentase " max "%.\n")
    print("Daftar nama customer di Albuquerque pada tahun 2017 antara lain: ")
    for (i in name)
        print i

    if (consumer < corporate && consumer < homeoffice) {tottrans = consumer; segmin = "Consumer";}
    else if (corporate < consumer && corporate < homeoffice) {tottrans = corporate; segmin = "Corporate";}
    else if (homeoffice < consumer && homeoffice < corporate) {tottrans = homeoffice; segmin = "Home Office";}

    print("Tipe segmen customer yang penjualannya paling sedikit adalah " segmin " dengan " tottrans " transaksi.\n")

    if (central < east && central < south && central < west) {terkecil = central; regionkecil = "Central";}
    else if (east < central && east < south && east < west) {terkecil = east; regionkecil = "East";}
    else if (south < central && south < east && south < west) {terkecil = south; regionkecil = "South";}
    else if (west < central && west < east && west < south) {terkecil = west; regionkecil = "West";}

    print("Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah " regionkecil " dengan total keuntungan " terkecil)
    }' Laporan-TokoShiSop.tsv >> hasil.txt
