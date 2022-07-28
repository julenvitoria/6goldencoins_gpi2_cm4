#!/bin/bash

#Instalar al actualizador del menu de addons
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
echo "Actualizando menu Addons..."
sleep 1
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/Actualizar.sh | bash
