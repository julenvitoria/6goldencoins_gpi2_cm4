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
echo "Descargando core lr-scummvm y aplicando fix..."
echo ""
mkdir /home/pi/scripts/tmp/
cd /home/pi/scripts/tmp/
/home/pi/scripts/github-downloader.sh https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/tree/master/menu-addons/patchs/lr-scummvm
sudo rm -R /opt/retropie/libretrocores/lr-scummvm
sudo cp -R lr-scummvm /opt/retropie/libretrocores/
sudo chmod +x /opt/retropie/libretrocores/lr-scummvm/scummvm_libretro.so
sudo chmod +x /opt/retropie/libretrocores/lr-scummvm/romdir-launcher.sh
cd ~
rm -r "/home/pi/scripts/tmp/"
sleep 2
