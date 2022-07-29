#!/bin/bash

echo ""
echo ""

#hacer directorio temporal
cd /home/pi
if [ -d /home/pi/tmp ]; then
        sudo rm -R /home/pi/tmp
        mkdir /home/pi/tmp
else
        mkdir /home/pi/tmp
fi

if [ -d "/home/pi/.emulationstation/themes/New-PandoraCypherV1OPTIMIZED/" ]; then
        echo "El tema Pandora ya se ha descargado anteriormente."
        echo "Borrando y volviendo a descargar..."
        sleep 2
        sudo rm -r "/home/pi/.emulationstation/themes/New-PandoraCypherV1OPTIMIZED/"
else
        echo "Descargando tema Pandora..."
        sleep 2
fi

#descargar tema y launchings
cd /home/pi/tmp
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins_gpi2_cm4/tree/main/themes/pandora

#mover el tema a su destino y cambiar propietario (por si acaso)
mv "/home/pi/tmp/pandora/New-PandoraCypherV1OPTIMIZED" "/home/pi/.emulationstation/themes"
cd "/home/pi/.emulationstation/themes/New-PandoraCypherV1OPTIMIZED/"
sudo chown pi:pi -R * 

#mover launchings a su destino
echo "Copiando launchings..."
sleep 3
cd /home/pi/tmp/pandora/launchings
cp -R * /opt/retropie/configs
cd /home/pi
rm -r tmp
echo "Proceso terminado"
sleep 1
#Cambiar el valor del tema en archivo de configuracion de emulationstation
sed -i 's/.*<string name="ThemeSet" value=.*/<string name="ThemeSet" value="New-PandoraCypherV1OPTIMIZED" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
#Cambiar valor "slide" en archivo configuracion emulationstation
sed -i 's/.*<string name="TransitionStyle".*/<string name="TransitionStyle" value="slide" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
#Reiniciar EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART