#!/bin/bash
#Codigo para seleccionar y distinguir regiones distintas entre 2 archivos .bed 
#Fecha de escritura:08/12/2022
#
sort -Vk1 -k2 -k3 human_coordinates_1.bed > orden_human_coord_1.txt
sort -Vk1 -k2 -k3 human_coordinates_2.bed > orden_human_coord_2.txt
diff -u orden_human_coord_1.txt orden_human_coord_2.txt > diff_orden_coord.txt 

diff1=$(grep -s "-chr" diff_orden_coord.txt)
#Resultados diferentes de human_cord_1
diff2=$(grep -s "+chr" diff_orden_coord.txt)
#Seran las diferenciass de human_coord_2
#
headiff1=$(grep -s "-chr" diff_orden_coord.txt | head -n1)
headiff2=$(grep -s "+chr" diff_orden_coord.txt | head -n1)

if [ "$headiff1" = "0" ]
        then
                echo "human_cord_1 no presenta filas diferentes con human_cord_2"
		

        else

                echo "human_cord_1 presenta estas filas mas que human_coord_2"
                echo "$diff1" | cut -c 2-

fi


if [ "$headiff2" != "0" ]

	then
                
		echo "human_cord_2 presenta estas filas mas que human_coord_1"
		echo "$diff2" | cut -c 2-
	

        else

                echo "human_cord_2 no presenta filas distintas con human_coord_1"
fi

