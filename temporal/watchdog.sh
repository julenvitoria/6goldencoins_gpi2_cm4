if grep "aplicado" /home/pi/scripts/watchdog.txt
then
    echo "ya esta hecho" > /home/pi/scripts/watchdog.txt
else
	echo "aplicado" > /home/pi/scripts/watchdog.txt
fi