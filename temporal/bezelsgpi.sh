#!/bin/bash
# Hecho para la imagen 6GoldenCoins por @JulenSR

INPUT=/tmp/bezelsgpi.sh.$$
dialog --backtitle "6 Golden Coins" \
--title "Bezels GPI Case 2" \
--ok-label Aplicar \
--cancel-label Salir \
--menu "Seleccionar (arriba/abajo) presiona A para aceptar: " 17 55 10 \
   1 "Aplicar Bezel GPI Case 2 (4:3 640x480)" \
   2 "Actualizar Bezels GPI Case 2" \
   3 "Salir" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)#Aplicar Bezel GPI Case 2 (4:3 640x480)
    clear
    echo ""
    echo ""
    echo ""
    echo "Aplicando la opcion seleccionada... un momento, por favor :)"
    #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
    find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
    find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
    cd /home/pi/scripts/bezelsconfig
    cp -R * /opt/retropie/configs/
    #cp /home/pi/RetroPie/script/atari5200/retroarch-1080.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


             Bezels GPI Case 2
                APLICADOS!!!!



  Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu principal bezelsgpi
    /home/pi/scripts/bezelsgpi.sh
    clear;;
  2)#Actualizar Bezels GPI Case 2
    clear
    echo ""
    echo ""
    echo ""
    #comprobamos la conexion a github
    if [ ! "`ping -c 1 github.com`" ]; then
        echo "No hay conexion con GitHub.com"
        echo "Por favor, revisa tu conexion."
        sleep 4
    else
        echo "Conexion con GitHub.com establecida, continuando..."
        sleep 2
        #revisamos di existe el directorio a donde descargaremos y si existe se borra para descargar de nuevo
        if [ -d "/home/pi/scripts/bezelsgpi/" ]; then
            rm -r "/home/pi/scripts/bezelsgpi/"
            sleep 1
        fi
        echo "Descargando bezels para GPI Case 2..."
        sleep 2
        #descargamos los bezels y los configs
        cd /home/pi/scripts
        /home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins_gpi2_cm4/tree/master/bezels
        #copiamos los configs a /opt/retropie/configs
        cd 
    fi
    #Retorno al menu principal bezelsgpi
    /home/pi/scripts/bezelsgpi.sh
    clear;;
  3)clear; exit 0;;
esac
clear