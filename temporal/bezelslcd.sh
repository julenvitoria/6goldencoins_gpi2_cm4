#!/bin/bash
# realizado para la imagen 6GoldenCoins de la gpi case 2 por @JulenSR

#Aplicar Bezel GPI Case 2 (4:3 640x480)
clear
echo ""
echo ""
echo ""
echo "Aplicando la opcion seleccionada... un momento, por favor :)"
#Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
cd /home/pi/scripts/bezels/bezelsgpiconf
cp -R * /opt/retropie/configs/
#cp /home/pi/RetroPie/script/atari5200/retroarch-1080.cfg /opt/retropie/configs/atari5200/retroarch.cfg
sleep 0.5
dialog --infobox "


             Bezels GPI Case 2
                APLICADOS!!!!



  Este mensaje se autocerrara en 3 segundos" 17 55 ; sleep 3