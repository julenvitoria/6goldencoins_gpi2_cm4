#!/bin/bash

echo ""
echo ""

cd /home/pi
if [ -d "/home/pi/.emulationstation/themes/Super Retroboy/" ]; then
        echo "Super Retroboy theme was downloaded yet"
        echo "Deleting and redownloading..."
        sleep 2
        sudo rm -r "/home/pi/.emulationstation/themes/Super Retroboy/"
        mkdir -p "/home/pi/.emulationstation/themes/Super Retroboy/" && git clone https://github.com/KALEL1981/Super_Retroboy_Theme.git "/home/pi/.emulationstation/themes/Super Retroboy/" --branch master --depth=1
        cd "/opt/retropie/configs/all/emulationstation/themes/Super Retroboy/"
        sudo chown pi:pi -R *        
        sed -i -e 's/<fontSize>0.042/<fontSize>0.06/g' SuperRetroboy.xml
        sed -i -e 's/<fontSize>0.025/<fontSize>0.035/g' SuperRetroboy.xml
        sed -i -e 's/<fontSize>0.04/<fontSize>0.055/g' SuperRetroboy.xml
else
        echo "Downloading Super Retroboy theme..."
        sleep 2
        mkdir -p "/home/pi/.emulationstation/themes/Super Retroboy/" && git clone https://github.com/KALEL1981/Super_Retroboy_Theme.git "/home/pi/.emulationstation/themes/Super Retroboy/" --branch master --depth=1
        cd "/opt/retropie/configs/all/emulationstation/themes/Super Retroboy/"
        sudo chown pi:pi -R * 
        sed -i -e 's/<fontSize>0.042/<fontSize>0.06/g' SuperRetroboy.xml
        sed -i -e 's/<fontSize>0.025/<fontSize>0.035/g' SuperRetroboy.xml
        sed -i -e 's/<fontSize>0.04/<fontSize>0.055/g' SuperRetroboy.xml
fi
cd /home/pi
if [ -d /home/pi/tmp ]; then
        sudo rm -R /home/pi/tmp
        mkdir /home/pi/tmp
else
        mkdir /home/pi/tmp
fi
cd /home/pi/tmp
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/Kelboy-SuperRetroBoyTheme
echo "COPYING LAUNCHING IMAGES..."
sleep 3
cp -R /home/pi/tmp/Kelboy-SuperRetroBoyTheme/trunk/configs/* /opt/retropie/configs
cp -R /home/pi/tmp/Kelboy-SuperRetroBoyTheme/trunk/systems/* "/opt/retropie/configs/all/emulationstation/themes/Super Retroboy/"
cd /home/pi
sudo rm -r tmp
sed -i 's/.*<string name="ThemeSet" value=.*/<string name="ThemeSet" value="Super Retroboy" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
sed -i 's/.*<string name="TransitionStyle".*/<string name="TransitionStyle" value="instant" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
/home/pi/scripts/multi_switch.sh --ES-RESTART