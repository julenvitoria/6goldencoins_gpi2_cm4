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
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoinspi4/tree/master/menu-addons/patchs/retroarch
sudo rm -R /opt/retropie/emulators/retroarch/bin
sudo rm -R /opt/retropie/emulators/retroarch/etc
chmod +x retroarch/bin/retroarch
chmod +x retroarch/bin/retroarch-cg2glsl
sudo cp -R retroarch/* /opt/retropie/emulators/retroarch/
cd ~
rm -r "/home/pi/scripts/tmp/"
sleep 2
