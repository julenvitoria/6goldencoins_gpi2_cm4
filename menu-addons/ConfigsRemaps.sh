#!/bin/bash

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
cd /home/pi
if [ -d '/home/pi/configsremaps' ] ;
then
        sudo rm -R '/home/pi/configsremaps'
        mkdir '/home/pi/configsremaps'
else
        mkdir '/home/pi/configsremaps'
fi
cd configsremaps
echo "Descargando y copiando configuraciones y remapeos de sistemas al directorio configs..."
sleep 2
/home/pi/scripts/github-downloader.sh https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/tree/master/configs
echo "Copiando archivos, por favor espera un momento..."
cp -R configs /opt/retropie/
cd ..
rm -r configsremaps