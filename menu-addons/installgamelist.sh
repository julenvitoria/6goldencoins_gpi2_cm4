#!/bin/bash

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
echo "Descargando y copiando el gamelist original de la imagen y reinstalando el menu Addons..."
sleep 2
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoinspi4/main/menu-addons/patchs/gamelist.xml>/opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoinspi4/main/menu-addons/ActualizarMenu.sh | bash

echo "Fix de instalacion con gamelist original aplicado!!!!"
sleep 3