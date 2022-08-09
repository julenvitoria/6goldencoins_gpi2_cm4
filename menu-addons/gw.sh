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
echo "Descargando core lr-gw y aplicando fix..."
echo ""
mkdir /home/pi/scripts/tmp/
cd /home/pi/scripts/tmp/
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins_gpi2_cm4/tree/master/menu-addons/patchs/lr-gw
sudo rm -R /opt/retropie/libretrocores/lr-gw
sudo cp -R lr-gw /opt/retropie/libretrocores/
sudo chmod +x /opt/retropie/libretrocores/lr-gw/gw_libretro.so
cd ~
rm -r "/home/pi/scripts/tmp/"
sleep 2
