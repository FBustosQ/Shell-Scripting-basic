#!/bin/bash
## ------------------------------------------------------------------
# Proposito: Cambio de bases nitrogenadas de ADN a ARN. 
# ------------------------------------------------------------------
# Nombre:                               Francisca Bustos
# Fecha:                                10-12-2022
# Comentarios:                          Prueba aplicativa curso Shell Scripting
# ------------------------------------------------------------------

#la idea es cambiar las bases nitrogenadas de todos los archivos secuencia secuencia*.fasta
#podria ser secuencia?.fasta pero es para un caso hipotetico de 10 o + secuencias
#

for file in /home/franciscabelen/Shell_Scripting/Prueba_aplicativa_2/Bustos_MorfologiaCriasPE_2022_Frontier/data/processed/secuencia*.fasta
do	
	
	namefile=$(basename -a "$file")
	sed -i "2s/T/U/g" "$file"
	
	if [[ -f $file ]]
	  then
		adenina=$(sed "2s/[GCU]//g" "$file" | tail -n1)
		guanina=$(sed "2s/[ACU]//g" "$file" | tail -n1)
		citocina=$(sed "2s/[GAU]//g" "$file" | tail -n1)
		uracilo=$(sed "2s/[GCA]//g" "$file" | tail -n1)
		seq=$(tail -n1 "$file")

		echo ""
                echo "Para el archivo $namefile de secuencia de ARN:"
                echo "$seq"
                echo "La cantidad de bases de $namefile es: Adenina=${#adenina}, Guanina=${#guanina}, Citocina=${#citocina}, Uracilo=${#uracilo}"
                echo ""
          else
                 echo "esto no esta funcionando"
        fi
 done

#nota no funciona sed si en vez de un archivo es una salida de un comando
