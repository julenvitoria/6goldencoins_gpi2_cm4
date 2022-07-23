#!/bin/bash

echo ""
echo ""
if [ ! "`ping -c 1 google.com`" ]
then
  echo "No hay conexion con internet"
  sleep 3
  exit 0
fi

echo "Conexion con internet establecida, continuando..."
sleep 2
echo "Actualizando los paquetes del sistema..."
echo ""
echo ""
sleep 1
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sleep 2