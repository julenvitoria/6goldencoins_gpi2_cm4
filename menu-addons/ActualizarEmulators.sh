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
echo "Descargando emulators.cfg..."
sleep 2
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoinspi4/main/menu-addons/patchs/emulators.cfg>/opt/retropie/configs/all/emulators.cfg