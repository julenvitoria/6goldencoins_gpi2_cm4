#!/bin/bash
# realizado para la imagen 6GoldenCoins de la gpi case 2 por @JulenSR

if  grep -q "enable_dpi_lcd=1" "/boot/config.txt"
then
	echo lcd > "/home/pi/scripts/prueba.txt
else
	echo hdmi > "/home/pi/scripts/prueba.txt	
fi

echo "Realizado!!!"
sleep 5