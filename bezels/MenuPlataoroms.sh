#!/bin/bash
# By Kactius y Re_tux
# Actualizado para la imagen 6GoldenCoins por @JulenSR
# Descomenta la siguiente linea para mostrar un video a modo de test
#omxplayer /opt/vc/src/hello_pi/hello_video/test.h264

INPUT=/tmp/MenuPlataoroms.sh.$$
dialog --backtitle "Plata o ROMs v3" \
--title "Opciones extra" \
--ok-label Aplicar \
--cancel-label Salir \
--menu "Seleccionar (arriba/abajo) presiona A para aceptar: " 17 55 10 \
   1 "Aplicar Bezel 16:9(Por defecto)" \
   2 "Aplicar Bezel 4:3" \
   3 "Aplicar Bezel 5:4" \
   4 "Aplicar Bezel (shader crt-pi) 16:9" \
   5 "Aplicar Bezel (shader crt-pi) 4:3" \
   6 "Aplicar Bezel (shader crt-pi) 5:4" \
   7 "Aplicar Bezel (solo bezel) 16:9" \
   8 "Aplicar Bezel (solo bezel) 4:3" \
   9 "Aplicar Bezel (solo bezel) 5:4" \
   10 "Aplicar Bezel GPI Case 2 (4:3 640x480)"\
   11 "Desactivar bezel" \
   12 "Actualizar bezel repo" \
   13 "Overclock Pi2, Pi3, Pi3b+ y Pi4 on-off" \
   14 "Ejecutar backup partidas" \
   15 "Creditos" \
   16 "Salir" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)#Aplicar Bezel 16:9(Por defecto)
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


            Bezel 16:9(Por defecto)
                APLICADOS!!!!



  Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu principal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  2)#Aplicar Bezel 4:3
    clear
    echo ""
    echo ""
    echo ""
    echo "Aplicando la opcion seleccionada... un momento, por favor :)"
    #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
    find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
    find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
    #Copiar pegar conservando atributos recursivamente
    cp -pr /home/pi/RetroPie/bezelsconfig/1024scanlines/* /
    sleep 2
    #Copiamos el contenido de hacks de arcade a arcade y despues borramos el directorio hacks
    #cp -pr /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #rm -R /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/
    #Copiamos los bezels de cps a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    cp -pr /home/pi/RetroPie/roms/cps/*.cfg /home/pi/RetroPie/roms/arcade
    cp -pr /home/pi/RetroPie/roms/cps/#\ Hacks\ Capcom\ Play\ System\ #/*.cfg /home/pi/RetroPie/roms/arcade
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/arcade\//g'
    #Copiamos los bezels de neogeo a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/#\ Hacks\ Neo\ Geo\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade\//g'
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
    cp /home/pi/RetroPie/script/atari5200/retroarch-1024scanlines.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


                   Bezel 4:3
                 APLICADOS!!!!



   Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu principal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  3)#Aplicar Bezel 5:4
    clear
    echo ""
    echo ""
    echo ""
    echo "Aplicando la opcion seleccionada... un momento, por favor :)"
    #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
    find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
    find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
    #Copiar pegar conservando atributos recursivamente
    cp -pr /home/pi/RetroPie/bezelsconfig/1280scanlines/* /
    #Copiamos el contenido de hacks de arcade a arcade y despues borramos el directorio hacks
    #cp -pr /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #rm -R /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/
    #Copiamos los bezels de cps a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    cp -pr /home/pi/RetroPie/roms/cps/*.cfg /home/pi/RetroPie/roms/arcade
    cp -pr /home/pi/RetroPie/roms/cps/#\ Hacks\ Capcom\ Play\ System\ #/*.cfg /home/pi/RetroPie/roms/arcade
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/arcade\//g'
    #Copiamos los bezels de neogeo a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/#\ Hacks\ Neo\ Geo\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade\//g'
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
    cp /home/pi/RetroPie/script/atari5200/retroarch-1280scanlines.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


                   Bezel 5:4
                 APLICADOS!!!!



  Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu princiapal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  4)#Aplicar Bezel (shader crt-pi) 16:9
    clear
    echo ""
    echo ""
    echo ""
    echo "Aplicando la opcion seleccionada... un momento, por favor :)"
    #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
    find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
    find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
    #Copiar pegar conservando atributos recursivamente
    cp -pr /home/pi/RetroPie/bezelsconfig/1080crt-pi/* /
    #Copiamos el contenido de hacks de arcade a arcade y despues borramos el dirfectorio hacks
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
    #cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/#\ Hacks\ Neo\ Geo\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade\//g'
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
    cp /home/pi/RetroPie/script/atari5200/retroarch-1080crt-pi.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


             Bezel (shader crt-pi) 16:9
                 APLICADOS!!!!



   Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu princiapal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  5)#Aplicar Bezel (shader crt-pi) 4:3
    clear
    echo ""
    echo ""
    echo ""
    echo "Aplicando la opcion seleccionada... un momento, por favor :)"
    #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
    find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
    find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
    #Copiar pegar conservando atributos recursivamente
    cp -pr /home/pi/RetroPie/bezelsconfig/1024crt-pi/* /
    #Copiamos el contenido de hacks de arcade a arcade y despues borramos el dirfectorio hacks
    #cp -pr /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #rm -R /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/
    #Copiamos los bezels de cps a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    cp -pr /home/pi/RetroPie/roms/cps/*.cfg /home/pi/RetroPie/roms/arcade
    cp -pr /home/pi/RetroPie/roms/cps/#\ Hacks\ Capcom\ Play\ System\ #/*.cfg /home/pi/RetroPie/roms/arcade
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/arcade\//g'
    #Copiamos los bezels de neogeo a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/#\ Hacks\ Neo\ Geo\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade\//g'
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
    cp /home/pi/RetroPie/script/atari5200/retroarch-1024crt-pi.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


             Bezel (shader crt-pi) 4:3
                 APLICADOS!!!!



   Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu princiapal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  6)#Aplicar Bezel (shader crt-pi) 5:4
    clear
    echo ""
    echo ""
    echo ""
    echo "Aplicando la opcion seleccionada... un momento, por favor :)"
    #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
    find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
    find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
    #Copiar pegar conservando atributos recursivamente
    cp -pr /home/pi/RetroPie/bezelsconfig/1280crt-pi/* /
    #Copiamos el contenido de hacks de arcade a arcade y despues borramos el dirfectorio hacks
    #cp -pr /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #rm -R /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/
    #Copiamos los bezels de cps a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    cp -pr /home/pi/RetroPie/roms/cps/*.cfg /home/pi/RetroPie/roms/arcade
    cp -pr /home/pi/RetroPie/roms/cps/#\ Hacks\ Capcom\ Play\ System\ #/*.cfg /home/pi/RetroPie/roms/arcade
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/arcade\//g'
    #Copiamos los bezels de neogeo a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/#\ Hacks\ Neo\ Geo\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade\//g'
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
    cp /home/pi/RetroPie/script/atari5200/retroarch-1280crt-pi.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


             Bezel (shader crt-pi) 5:4
                 APLICADOS!!!!



   Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu princiapal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  7)#Aplicar Bezel (solo bezel) 16:9
    clear
    echo ""
    echo ""
    echo ""
    echo "Aplicando la opcion seleccionada... un momento, por favor :)"
    #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
    find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
    find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
    #Copiar pegar conservando atributos recursivamente
    cp -pr /home/pi/RetroPie/bezelsconfig/1080solobezels/* /
    #Copiamos el contenido de hacks de arcade a arcade y despues borramos el dirfectorio hacks
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
    cp /home/pi/RetroPie/script/atari5200/retroarch-1080solobezels.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


            Bezel (solo bezel) 16:9
                APLICADOS!!!!



  Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu princiapal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  8)#Aplicar Bezel (solo bezel) 4:3
    clear
    echo ""
    echo ""
    echo ""
    echo "Aplicando la opcion seleccionada... un momento, por favor :)"
    #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
    find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
    find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
    #Copiar pegar conservando atributos recursivamente
    cp -pr /home/pi/RetroPie/bezelsconfig/1024solobezels/* /
    #Copiamos el contenido de hacks de arcade a arcade y despues borramos el dirfectorio hacks
    #cp -pr /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #rm -R /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/
    #Copiamos los bezels de cps a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    cp -pr /home/pi/RetroPie/roms/cps/*.cfg /home/pi/RetroPie/roms/arcade
    cp -pr /home/pi/RetroPie/roms/cps/#\ Hacks\ Capcom\ Play\ System\ #/*.cfg /home/pi/RetroPie/roms/arcade
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/arcade\//g'
    #Copiamos los bezels de neogeo a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/#\ Hacks\ Neo\ Geo\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade\//g'
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
    cp /home/pi/RetroPie/script/atari5200/retroarch-1024solobezels.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


            Bezel (solo bezel) 4:3
                APLICADOS!!!!



  Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
    #Retorno al menu princiapal scriptMenuPlataoroms
    /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  9)#Aplicar Bezel (solo bezel) 5:4
    clear
    echo ""
    echo ""
    echo ""
    echo "Aplicando la opcion seleccionada... un momento, por favor :)"
    #Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
    find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
    find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
    #Copiar pegar conservando atributos recursivamente
    cp -pr /home/pi/RetroPie/bezelsconfig/1280solobezels/* /
    #Copiamos el contenido de hacks de arcade a arcade y despues borramos el dirfectorio hacks
    #cp -pr /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #rm -R /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/
    #Copiamos los bezels de cps a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    cp -pr /home/pi/RetroPie/roms/cps/*.cfg /home/pi/RetroPie/roms/arcade
    cp -pr /home/pi/RetroPie/roms/cps/#\ Hacks\ Capcom\ Play\ System\ #/*.cfg /home/pi/RetroPie/roms/arcade
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/arcade\//g'
    find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/arcade\//g'
    #Copiamos los bezels de neogeo a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
    #cp -pr /home/pi/RetroPie/roms/neogeo/#\ Hacks\ Neo\ Geo\ #/*.cfg /home/pi/RetroPie/roms/arcade
    #find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade\//g'
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
    cp /home/pi/RetroPie/script/atari5200/retroarch-1280solobezels.cfg /opt/retropie/configs/atari5200/retroarch.cfg
    sleep 0.5
    dialog --infobox "


            Bezel (solo bezel) 5:4
                APLICADOS!!!!



  Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3
      #Retorno al menu princiapal scriptMenuPlataoroms
      /home/pi/RetroPie/script/MenuPlataoroms.sh
    clear;;
  10)#Aplicar Bezel GPI Case 2 (4:3 640x480)
     clear
     /home/pi/RetroPie/script/bezelsgpi.sh
     #Retorno al menu princiapal scriptMenuPlataoroms
     /home/pi/RetroPie/script/MenuPlataoroms.sh
     clear;;
  11)#Desactivar bezel
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
  12)#Actualizar bezel repo
     clear
     /home/pi/RetroPie/script/actualizabezelrepo.sh
     clear;;
  13)#Overclock Pi2, Pi3, pi3b+ y pi4 on-off
     clear
     /home/pi/RetroPie/script/overclock.sh
     clear;;
  14)#Ejecutar backup partidas
     clear
     /home/pi/RetroPie/script/Installer_savegame/Install_savegames.sh
     clear;;
  15)clear
     sudo /home/pi/RetroPie/retropiemenu/Creditos.sh
     sudo /home/pi/RetroPie/script/MenuPlataoroms.sh
     clear;;
  16)clear; exit 0;;
esac
clear