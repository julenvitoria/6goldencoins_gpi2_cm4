#!/bin/bash

cd /home/pi
if [ -d "/home/pi/.emulationstation/themes/SuperLopezGB/" ]; then
        echo "Super Lopez GB theme was downloaded yet"
        echo "Deleting and redownloading..."
        sleep 2
        sudo rm -r "/home/pi/.emulationstation/themes/SuperLopezGB/"
        mkdir -p "/home/pi/.emulationstation/themes/SuperLopezGB/" && sudo git clone https://github.com/mlopezmad/SuperLopezGB "/home/pi/.emulationstation/themes/SuperLopezGB/"
else
        echo "Downloading Super Lopez GB theme..."
        sleep 2
        mkdir -p "/home/pi/.emulationstation/themes/SuperLopezGB/" && git clone https://github.com/mlopezmad/SuperLopezGB "/home/pi/.emulationstation/themes/SuperLopezGB/"
        sudo chown pi:pi /home/pi/.emulationstation/themes/SuperLopezGB -R
fi

cd "/home/pi/.emulationstation/themes/SuperLopezGB/"
sudo rm -R .git
sudo chown pi:pi -R *

#make temporal directory
cd /home/pi
if [ -d /home/pi/tmp ]; then
        sudo rm -R /home/pi/tmp
        mkdir /home/pi/tmp
else
        mkdir /home/pi/tmp
fi
#Download and install launching images
cd /home/pi/tmp
/home/pi/scripts/github-downloader.sh https://github.com/mlopezmad/SuperLopezGB-Launching
echo "COPYING LAUNCHING IMAGES..."
sleep 3
cp -R SuperLopezGB-Launching/trunk/* /opt/retropie/configs
cd /home/pi
rm -r tmp
echo "Proceso concluido"
sleep 1
#Change theme value on EmulationStation config file
sed -i 's/.*<string name="ThemeSet" value=.*/<string name="ThemeSet" value="SuperLopezGB" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
#Change theme value on EmulationStation config file
sed -i 's/.*<string name="TransitionStyle".*/<string name="TransitionStyle" value="slide" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART