#!/bin/bash
# By Kactius y Re_tux
# Actualizado para la imagen 6GoldenCoins de la gpi case 2 por @JulenSR
# Descomenta la siguiente linea para mostrar un video a modo de test
#omxplayer /opt/vc/src/hello_pi/hello_video/test.h264

INPUT=/tmp/MenuPlataoroms.sh.$$
dialog --backtitle "Plata o ROMs v3" \
--title "Opciones extra" \
--ok-label Aplicar \
--cancel-label Salir \
--menu "Seleccionar (arriba/abajo) presiona A para aceptar: " 17 55 10 \
   1 "Aplicar Bezel 16:9 (HDMI) y 4:3 (LCD)  " \
   2 "Desactivar bezel" \
   3 "Actualizar bezel repo" \
   4 "Overclock Pi2, Pi3, Pi3b+ y Pi4 on-off" \
   5 "Ejecutar backup partidas" \
   6 "Creditos" \
   7 "Salir" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)#Aplicar Bezels (Por defecto)
     clear
     echo ""
     echo ""
     echo ""
     echo "Aplicando la opcion seleccionada... un momento, por favor :)"
     if grep "lcd" /home/pi/scripts/modopantalla.txt ; then
        #Aplicar Bezel GPI Case 2 (4:3 640x480)
        clear
        echo ""
        echo ""
        echo ""
        echo "Aplicando bezels 4:3... un momento, por favor :)"
        #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
        find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
        find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
        cd /home/pi/scripts/bezels/bezelsgpiconf
        cp -R * /opt/retropie/configs/
        #cp /home/pi/RetroPie/script/atari5200/retroarch-1080.cfg /opt/retropie/configs/atari5200/retroarch.cfg
        sleep 2
        echo lcd > /home/pi/scripts/modo.txt
     fi
     if grep "hdmi" /home/pi/scripts/modopantalla.txt ; then
        clear
        echo ""
        echo ""
        echo ""
        echo "Aplicando bezels 16:9... un momento, por favor :)"
        #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
        find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
        find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
        #Copiar pegar conservando atributos recursivamente
        cp -pr /home/pi/RetroPie/bezelsconfig/1080/* /
        #Copiamos el contenido de hacks de arcade a arcade y despues borramos el directorio hacks
        cp -pr '/home/pi/RetroPie/roms/arcade/# Hacks Arcade Games #/*.cfg' /home/pi/RetroPie/roms/arcade
        #rm -R /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/
        #Copiamos los bezels de cps a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
        cp -pr /home/pi/RetroPie/roms/cps/*.cfg /home/pi/RetroPie/roms/arcade
        cp -pr '/home/pi/RetroPie/roms/cps/# Hacks Capcom Play System #/*.cfg' /home/pi/RetroPie/roms/arcade
        find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps\//opt\/retropie\/configs\/arcade/g'
        find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/arcade/g'
        find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/arcade/g'
        find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/arcade/g'
        #Copiamos los bezels de neogeo a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
        cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
        cp -pr '/home/pi/RetroPie/roms/neogeo/# Hacks Neo Geo #/*.cfg' /home/pi/RetroPie/roms/arcade
        find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade/g'
        #Modificamos los cfg de cps para que apunten todos a /opt/retropie/configs/cps y no a cps1. cps2 y cps3
        find /home/pi/RetroPie/roms/cps/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/cps/g'
        find /home/pi/RetroPie/roms/cps/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/cps/g'
        find /home/pi/RetroPie/roms/cps/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/cps/g'
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
        sleep 1
        find /home/pi/RetroPie/roms/ -name "*.cfg" -type f -print0 | xargs -0 sed -i 's/video_fullscreen_x/#video_fullscreen_x/g'
        find /home/pi/RetroPie/roms/ -name "*.cfg" -type f -print0 | xargs -0 sed -i 's/video_fullscreen_y/#video_fullscreen_y/g'
        cd /home/pi/scripts/bezels/configshdmi
        cp -R * /opt/retropie/configs/
        sleep 1
        echo hdmi > /home/pi/scripts/modo.txt
     fi
	 echo on > /home/pi/scripts/desactivado.txt
     #Retorno al menu principal scriptMenuPlataoroms
     /home/pi/RetroPie/script/MenuPlataoroms.sh
     clear;;
  2)#Desactivar bezel
     clear
     echo ""
     echo ""
     echo ""
     echo "Aplicando la opcion seleccionada... un momento, por favor :)"
     # Buscar en /ruta/ tipo fichero -de extension *cfg borrar f los encontrados
     find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
     #Buscar en /ruta/ -fichero \( -de nombre retroarch.cfg -a que no esten en /all/retroarch.cfg borrar los encontrados
     find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
     #Copiar pegar conservando atributos recursivamente
     cp -pr /home/pi/RetroPie/bezelsconfig/sinbezels/* /
     #Modificamos la ganacia de audio en los diferentes sistemas para que no distorsione con el nuevo mezclador pulseaudio
     find /opt/retropie/configs -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "0.000000"/'
     find /opt/retropie/configs/arcade -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
     find /opt/retropie/configs/cave -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
     find /opt/retropie/configs/cps -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
     find /opt/retropie/configs/cps1 -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
     find /opt/retropie/configs/cps2 -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
     find /opt/retropie/configs/cps3 -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
     find /opt/retropie/configs/vectrex -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
     cp /home/pi/RetroPie/script/atari5200/retroarch-sinbezels.cfg /opt/retropie/configs/atari5200/retroarch.cfg
     sleep 0.5
     dialog --infobox "


                       Bezel
                   Desactivados!!!!


      Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
     echo off > /home/pi/scripts/desactivado.txt
	 #Retorno al menu princiapal scriptMenuPlataoroms
     /home/pi/RetroPie/script/MenuPlataoroms.sh
     clear;;
  3)#Actualizar bezel repo
     clear
     /home/pi/RetroPie/script/actualizabezelrepo.sh
     clear;;
  4)#Overclock Pi2, Pi3, pi3b+ y pi4 on-off
     clear
     /home/pi/RetroPie/script/overclock.sh
     clear;;
  5)#Ejecutar backup partidas
     clear
     /home/pi/RetroPie/script/Installer_savegame/Install_savegames.sh
     clear;;
  6)clear
     sudo /home/pi/RetroPie/retropiemenu/Creditos.sh
     sudo /home/pi/RetroPie/script/MenuPlataoroms.sh
     clear;;
  7)clear; exit 0;;
esac
clear