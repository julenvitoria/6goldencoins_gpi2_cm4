#!/bin/bash

clear
echo ""
echo ""
echo ""
if [ ! "`ping -c 1 github.com`" ]
then
  echo "No hay conexion con GitHub.com"
  sleep 3
  exit 0
fi

echo "Conexion con GitHub.com establecida, continuando..."
sleep 2
if [ -d "/home/pi/scripts/tmp/" ]; then
    echo "Borrando directorio temporal..."
    echo ""
    rm -r "/home/pi/scripts/tmp/"
    sleep 1
fi
echo "Descargando binario de ES en español y aplicando fix..."
echo ""
mkdir /home/pi/scripts/tmp/
cd /home/pi/scripts/tmp/
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins_gpi2_cm4/blob/master/menu-addons/patchs/emulationstation
chmod +x emulationstation
if [ -f "/home/pi/scripts/tmp/emulationstation" ]; then
    /home/pi/scripts/multi_switch.sh --es-systemd
    sleep 1
    sudo cp emulationstation /opt/retropie/supplementary/emulationstation/
    echo ""
    echo "El sistema se reiniciará en 3 segundos..."
    sleep 3
    cd ~
    rm -r "/home/pi/scripts/tmp/"
    sleep 0.5
    sudo reboot
else
    echo ""
    echo "El binario de ES no se descargó... nada que aplicar"
    sleep 2
fi
cd ~
rm -r "/home/pi/scripts/tmp/"
sleep 2
