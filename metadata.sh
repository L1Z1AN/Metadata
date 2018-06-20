#!/bin/bash
#
function meta {
echo -e "\033[1;35m ------------------------------------------------ \033[0m"
echo -e "\033[0;36m |  (+_+)                __    |    v1.0 (+_+)  | \033[0m"
echo -e "\033[0;36m |           |\/| _|_ _ |  \ _ |_ _             | \033[0m"
echo -e "\033[0;36m |           |  |(-|_(_||__/(_||_(_|            | \033[0m"
echo -e "\033[0;36m |  (+_+)   77 101 116 97 68 97 116 97   (+_+)  | \033[0m"
echo -e "\033[1;35m ------------------------------------------------ \033[0m"
}
 sleep 1; clear; meta; sleep 1;
echo -e "\033[1;31m  route of file: $1 \033[0m"
echo -e "\033[1;34m ----------Options---------- \033[0m"
echo -e "\033[1;33m   1- Ver MetaDatos        \033[0m"
echo -e "\033[1;33m   2- Borrar Metadatos     \033[0m"
echo -e "\033[1;33m   3- Guardar Datos en txt \033[0m"
echo -e "\033[1;33m   4- Modificar MetaDatos  \033[0m"
echo -e "\033[1;33m   5- Borrar file original \033[0m"
     read -n 1 -p ' [?] ==> ' opcion
 if [ $opcion -eq 1 ]; then
	clear; sleep 1;
	echo -e "\033[1;35m [+] MetaDatos \033[0m"
 	   exiftool -a -u -g1 $1
 fi
   if [ $opcion -eq 2 ]; then
	clear; sleep 1; echo;
	  exiftool -all= $1; echo;
         echo -e "\033[1;35m [+] MetaDatos Eliminados \033[0m\n"
      fi
   if [ $opcion -eq 3 ]; then
	 sleep 1; echo;
	  read -p 'Nombre del Archivo con Extencion: ' name
	  read -p 'Ruta para Guardar: ' route
	exiftool $1 >> $route/$name; echo;
	echo -e "\033[1;35m [+] Metadatos Guardados en TXT \033[0m\n"
      fi
   if [ $opcion -eq 4 ]; then
	clear; sleep 1;
	  echo
 echo -e "\033[1;32m  ∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆ \033[0m"
 echo -e "\033[1;35m  ∆∆∆∆∆  __________---------________   ∆∆∆∆∆ \033[0m"
 echo -e "\033[1;35m  ∆∆∆∆∆     155 157 144 151 146 171    ∆∆∆∆∆ \033[0m"
 echo -e "\033[1;35m  ∆∆∆∆∆              MODIFY            ∆∆∆∆∆ \033[0m"
 echo -e "\033[1;32m  ∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆∆ \033[0m"
   sleep 1;
 echo -e "\033[1;31m  route of file: $1 \033[0m"
 echo -e "\033[1;34m ------------Options--------------- \033[0m"
 echo -e "\033[1;33m   Agregar Copyright       ---> 1  \033[0m"
 echo -e "\033[1;33m   Agregar Coordenadas     ---> 2  \033[0m"
 echo -e "\033[1;33m   Agregar Autor o Artista ---> 3  \033[0m"
 echo -e "\033[1;33m   Agregar Marca de Camara ---> 4  \033[0m"
 echo -e "\033[1;33m   Agregar Comentario      ---> 5  \033[0m"
   read -n 1 -p ' [?] >-> ' option
case $option in
		1*)
         sleep 1; echo;
          read -p 'Copyright: ' cpt
          sleep 2; echo;
           exiftool -exif:Copyright=$cpt $1
         echo -e "\033[1;35m [✓] Copyright Agregado \033[0m\n"
         ;;
		2*)
         sleep 1; echo;
         read -p 'GPSlatitud: ' lat
         read -p 'GPSlatituderef: ' lati
         read -p 'GPSlongitude: ' long
          sleep 2; echo;
exiftool -exif:gpslatitude=$lat $1 -exif:gpslatituderef=$lati -exif:gpslongitude=$long
		  echo -e "\033[1;35m [✓] Coordenadas Añadidas \033[0m\n"
         ;;
        3*)
         sleep 1; echo;
          read -p 'Autor o Creador: ' dat
         sleep 2; echo;
        exiftool -artist=$dat $1
         echo -e "\033[1;35m [√] Añadido \033[0m\n"
         ;;
		4*)
         sleep 1; echo;
          read -p 'Marca del Dispositivo: ' marca
          sleep 2; echo;
         exiftool -make=$marca $1
          echo -e "\033[1;35m [√] Agregado \033[0m\n"
         ;;
		5*)
         sleep 1; echo;
          read -p 'Escribe un Comentario: ' comm
          sleep 2; echo;
         exiftool -comment=$comm $1
          echo -e "\033[1;35m [√] Comentario Añadido \033[0m\n"
          ;;
		*)
          echo
         echo -e "\033[1;36m Parametro incorrecto \033[0m\n"
         ;;
   esac
 fi
   if [ $opcion -eq 5 ]; then
   sleep 1; echo;
		rm -R $1_original
         sleep 2; echo;
        echo -e "\033[1;35m [√] Archivo Eliminado \033[0m\n"
else
   echo
 fi