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
   1 "Aplicar Bezel 16:9  " \
   2 "Submenu Bezel GPI Case 2 (4:3 640x480)"\
   3 "Desactivar bezel" \
   4 "Actualizar bezel repo" \
   5 "Overclock Pi2, Pi3, Pi3b+ y Pi4 on-off" \
   6 "Ejecutar backup partidas" \
   7 "Creditos" \
   8 "Salir" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)#Aplicar Bezels (Por defecto)
     clear
     echo ""
     echo ""
     echo ""
     echo "Aplicando la opcion seleccionada... un momento, por favor :)"
     if grep "lcd" /home/pi/scripts/modo.txt ; then
        /home/pi/scripts/bezelslcd.sh
     fi
     if grep "hdmi" /home/pi/scripts/modo.txt ; then
        /home/pi/scripts/bezelshdmi.sh
     fi
     #Retorno al menu principal scriptMenuPlataoroms
     /home/pi/RetroPie/script/MenuPlataoroms.sh
     clear;;
  2)#Submenu Bezel GPI Case 2 (4:3 640x480)
     clear
     /home/pi/scripts/bezelsgpi.sh
     #Retorno al menu princiapal scriptMenuPlataoroms
     /home/pi/RetroPie/script/MenuPlataoroms.sh
     clear;;
  3)#Desactivar bezel
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
     #Retorno al menu princiapal scriptMenuPlataoroms
     /home/pi/RetroPie/script/MenuPlataoroms.sh
     clear;;
  4)#Actualizar bezel repo
     clear
     /home/pi/RetroPie/script/actualizabezelrepo.sh
     clear;;
  5)#Overclock Pi2, Pi3, pi3b+ y pi4 on-off
     clear
     /home/pi/RetroPie/script/overclock.sh
     clear;;
  6)#Ejecutar backup partidas
     clear
     /home/pi/RetroPie/script/Installer_savegame/Install_savegames.sh
     clear;;
  7)clear
     sudo /home/pi/RetroPie/retropiemenu/Creditos.sh
     sudo /home/pi/RetroPie/script/MenuPlataoroms.sh
     clear;;
  16)clear; exit 0;;
esac
clear