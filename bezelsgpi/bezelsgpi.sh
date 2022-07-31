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

    
    #Copiar pegar conservando atributos recursivamente
    cp -pr /home/pi/RetroPie/bezelsconfig/1080/* /
    #Copiamos el contenido de hacks de arcade a arcade y despues borramos el directorio hacks
    cp -pr /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #rm -R /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/
    #Copiamos los bezels de cps a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    cp -pr /home/pi/RetroPie/roms/cps/*.cfg /home/pi/RetroPie/roms/arcade
    cp -pr /home/pi/RetroPie/roms/cps/#\ Hacks\ Capcom\ Play\ System\ #/*.cfg /home/pi/RetroPie/roms/arcade
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/arcade\//g'
    #Copiamos los bezels de neogeo a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
    cp -pr /home/pi/RetroPie/roms/neogeo/#\ Hacks\ Neo\ Geo\ #/*.cfg /home/pi/RetroPie/roms/arcade
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade\//g'
    #Modificamos los cfg de cps para que apunten todos a /opt/retropie/configs/cps y no a cps1. cps2 y cps3
    find /home/pi/RetroPie/roms/cps/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/cps\//g'
    find /home/pi/RetroPie/roms/cps/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/cps\//g'
    find /home/pi/RetroPie/roms/cps/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/cps\//g'
    #Modificamos la ganacia de audio en los diferentes sistemas para que no distorsione con el nuevo mezclador pulseaudio
    find /opt/retropie/configs -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "0.000000"/'
    find /opt/retropie/configs/arcade -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
    find /opt/retropie/configs/cave -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
    find /opt/retropie/configs/cps -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
    find /opt/retropie/configs/cps1 -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
    find /opt/retropie/configs/cps2 -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
    find /opt/retropie/configs/cps3 -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
    find /opt/retropie/configs/vectrex -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
    cp /home/pi/RetroPie/script/atari5200/retroarch-1080.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


             Bezels GPI Case 2
                APLICADOS!!!!



  Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu principal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  2)#Actualizar Bezels GPI Case 2
        #hacer directorio temporal
    cd /home/pi
    if [ -d /home/pi/tmp ]; then
            sudo rm -R /home/pi/tmp
            mkdir /home/pi/tmp
    else
            mkdir /home/pi/tmp
    fi
    cd /home/pi/tmp
    /home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins_gpi2_cm4/tree/master/themes/pandora
    
    
    
    #Retorno al menu principal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  3)clear; exit 0;;
esac
clear