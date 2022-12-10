#!/bin/sh
## ------------------------------------------------------------------
# Proposito: Seleccionar una secuencia al azar de un formato FASTQ a FASTA
# incluye el alacenamiento de la secuencia y el detalle de los nombres de 
# la secuencia elegida al asar en la salida estandar. 
# ------------------------------------------------------------------
# Nombre:				Francisca Bustos
# Fecha:				09-12-2022
# Comentarios:				Prueba aplicativa curso Shell Scripting
# ------------------------------------------------------------------
cd ~/Shell_Scripting/Prueba_aplicativa_2/Bustos_MorfologiaCriasPE_2022_Frontier/data/raw || return 
#Actualmente este archivo esta en una carpeta diferente a la ubicacion de los datos 
# || return o exit es una recomendaicon de ShellCheck

num_repeticiones=($(grep -c '@SRR*.*' SRR1984406_1.fastq))
#marca el rango de numeros para el comando RANDOM

name_seq=($(sed -n '/@SRR*.*/p' SRR1984406_1.fastq | cut -d ' ' -f1))
# Array de nombres de las secuencias del archivo


#resultado=($(sed -n '/@SRR*.*/,+1p' SRR1984406_1.fastq)) | tr ['@'] ['>'] > ../processed/all_sequences.fasta
#Se puede realizar un almacenamiento general de todo el 
#archivo fastaq y almacenarlo transformado a fasta con el codigo anterior

seq=(1 2 3 4 5)

for seq in {1..5}
do 
	random_seq=RANDOM%$num_repeticiones
	echo "$seq secuencia"
	sed -n "/${name_seq[$random_seq]}/,+1p" SRR1984406_1.fastq | tr ['@'] ['>'] > ../processed/secuencia$seq.fasta | echo "Almacenamiento de seq ${name_seq[$random_seq]} en data/processed"	


done
#en la salida estandar se vera el nombre de la secuencia con el numero del 1 al 5 con el q se almaceno
#
#por precaucion de alguna modificacion del random, se incluyo en el for y en una variable

