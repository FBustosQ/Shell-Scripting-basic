#!/bin/bash
## ------------------------------------------------------------------
# Proposito: Verificar si la secuencia de formato fasta es nucleotido o aminoacido. 
# ------------------------------------------------------------------
# Nombre:                               Francisca Bustos
# Fecha:                                10-12-2022
# Comentarios:                          Prueba aplicativa curso Shell Scripting
# ------------------------------------------------------------------

#la idea es q se escriba el nombre de un archivo y este revise si es aminoacido o nucleotido 
#



#f_fasta=$(read).fasta
#no funciona esa forma de escritura


echo "Introduce el nombre del archivo sin la terminación fasta"
read file

ruta_file=$(find ~/Shell_Scripting/Prueba_aplicativa_2/Bustos_MorfologiaCriasPE_2022_Frontier/data/processed -name "$file.fasta")
#la carpeta esta configurada para q se guarden las secuencias en esa ruta

if [ -f "$ruta_file" ]
 then
	seq=$(tail -n1 $ruta_file)
	#los archivos secuencia.. estan con solo una secuencia y su identificador
	nucleotidos=$(tail -n1 $ruta_file | grep -E "[CTAGY]") #agruegue el tail por si el nombre de la secuencia contenia las letras anteriores

	if [ $seq = $nucleotidos ] # comparo el la secuencia original con la busqueda de nucleotidos
	 then 
		 echo "La secuencia del archivo $file son nucleotidos"
		 echo "$seq"
	 	 
	 else
		echo "La secuencia del archivo $file son aminoacidos"
	fi

 else
	echo "El archivo $file no existe"
fi
