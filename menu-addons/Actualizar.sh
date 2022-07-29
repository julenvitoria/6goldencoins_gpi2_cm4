#!/bin/bash

echo ""
echo ""
cd /home/pi
if [ -d '/home/pi/RetroPie/retropiemenu/#Menu-Addons' ]; then
        echo "Directorio Menu-Addons ya fue creado anteriormente."
        echo "Actualizando Menu-Addons..."
        sleep 2
        rm -R '/home/pi/RetroPie/retropiemenu/#Menu-Addons'
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons'
else
        echo "Creando directorio Menu-Addons e instalando..."
        sleep 2
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons'
fi

#Añadir menu addons al gamelist del menu retropie
if grep -q "#14.Menu addons" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El Menu-Addons ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<folder>\n\t\t<path>./#Menu-Addons/</path>\n\t\t<name>#14.Menu addons</name>\n\t\t<desc>Acceso al menú Addons donde podrá ver diferentes opciones para realizar diversas operaciones tales como descargar el archivo emulators.cfg original (o la actualizacion que haya en github) o restaurar sistemas en el es_systems.cfg que estaban en la imagen original porque se hayan ido al hacer una actualizacion. ¡¡¡ ATENCION IMPORTANTE: ES NECESARIO TENER CONEXION A INTERNET PARA EL CORRECTO FUNCIONAMIENTO DE ESTE MENU!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/Menu.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</folder>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Añadir menu fixes al gamelist del menu retropie
if grep -q "#Fixes" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El Menu Fixes ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<folder>\n\t\t<path>./#Menu-Addons/#fixes</path>\n\t\t<name>#Fixes</name>\n\t\t<desc>Acceso al menú Fixes. ¡¡¡ ATENCION IMPORTANTE: LEER LA DESCRIPCION DE CADA FIX AL IR A EJECUTARLO, PODRIA DAÑAR ALGO SI NO SE UTILIZA DE MANERA CORRECTA!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/Fixes.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</folder>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar al actualizador del menu de addons
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/ActualizarMenu.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarMenu.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/ActualizarMenu.sh'
if grep -q "ActualizarMenu.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El actualizador de Menu-Addons ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/ActualizarMenu.sh</path>\n\t\t<name>Actualizar este menu</name>\n\t\t<desc>Script para actualizar el menu addons. Aparte de realizar cambios en los scripts tambien es posible que aparezcan nuevas opciones despues de actualizar.</desc>\n\t\t<image>./#Menu-Addons/iconos/ActualizarMenu.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar el actualizador del sistema
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/UpdateUpgrade.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateUpgradeSystem.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateUpgradeSystem.sh'
if grep -q "UpdateUpgradeSystem.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El script update y upgrade al sistema ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/UpdateUpgradeSystem.sh</path>\n\t\t<name>Actualizar sistema operativo</name>\n\t\t<desc>Script para actualizar los paquetes del sistema de manera con un solo click ¡¡¡ATENCION: USA BAJO TU PROPIA RESPONSABILIDAD!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/UpdateUpgrade.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
#Instalar actualizador emulators.cfg
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/ActualizarEmulators.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateEmulators.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/UpdateEmulators.sh'
if grep -q "ActualizarEmulators.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El script para actualizar el archivo emulators.cfg ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/UpdateEmulators.sh</path>\n\t\t<name>Descargar/actualizar emulators.cfg desde github</name>\n\t\t<desc>Script para descargar el archivo emulators.cfg original de la imagen o la actualizacion que haya en ese momento en el GitHub. Esto significa que tambien cambiara en el caso de que se realice algun cambio para mejorar la emulacion en algun juego. ¡¡¡ATENCION: Si has realizado cambios en la eleccion de emuladores y ejecutas esta operacion perderas dichos cambios si no existen en el archivo descargado. En este caso se recomienda realizar una copia de seguridad del archivo emulators.cfg ubicado en /opt/retropie/configs/all o por SAMBA en en el directorio CONFIGS antes de ejecutarlo!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/UpdateEmulators.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar ConfigsRemaps
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/ConfigsRemaps.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/ConfigsRemaps.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/ConfigsRemaps.sh'
if grep -q "ConfigsRemaps.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "ConfigsRemaps ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/ConfigsRemaps.sh</path>\n\t\t<name>Descargar/actualizar configuraciones y remapeos originales</name>\n\t\t<desc>Script para descargar/actualizar configuraciones de emuladores y mapeos de diversos juegos y sistemas. ¡¡¡ATENCION: Si has realizado cambios en las configuraciones o remapeos y ejecutas esta operacion perderas dichos cambios si al descargarse se machacan los archivos. En este caso se recomienda realizar una copia de seguridad antes de ejecutarlo!!!</desc>\n\t\t<image>./#Menu-Addons/iconos/ConfigsRemaps.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar restaurar sistemas
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/restoresystems.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/restoresystems.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/restoresystems.sh'
if grep -q "restoresystems.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Restore Systems ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/restoresystems.sh</path>\n\t\t<name>Restaurar sistemas de EmulationStation</name>\n\t\t<desc>Script para instalar/restaurar sistemas personalizados adicionales en es_systems.cfg después de por ejemplo una actualización a traves de retropie-setup. ¡¡¡ATENCION: SI SE HAN HECHO CAMBIOS ADICIONALES EN EL ARCHIVO es_systems.cfg UBICADO EN /opt/retropie/configs/all/emulationstation SE PERDERAN A EJECUTARSE ESTA OPCION PORQUE SE MACHACARA CON EL QUE SE DESCARGUE!!! Se recomienda realizar una copia de seguridad antes de ejecutar esta operación.</desc>\n\t\t<image>./#Menu-Addons/iconos/restoresystems.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Crear directorio de temas
if [ -d '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas' ]; then
        echo "Directorio temas ya fue creado anteriormente... Borrando y descargando de nuevo..."
        sleep 2
        rm -R '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas'
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas'
else
        echo "Creando directorio temas y descargándolos..."
        sleep 2
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas'
fi

#Instalar tema y launchings Super Retroboy 
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/themes/SuperRetroBoy.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas/SRBtheme.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas/SRBtheme.sh'
if grep -q "SRBtheme.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "SRBtheme ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#Temas/SRBtheme.sh</path>\n\t\t<name>SuperRetroBoy theme + Launchings</name>\n\t\t<desc>Script para instalar el tema Super Retro Boy de KALEL1981 y launchings de sistemas a juego.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar tema y launchings SuperLopezGB
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/themes/SLGBtheme.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas/SLGBtheme.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas/SLGBtheme.sh'
if grep -q "SLGBtheme.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "SLGBtheme ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#Temas/SLGBtheme.sh</path>\n\t\t<name>SuperLopezGB theme + Launchings</name>\n\t\t<desc>Script para instalar el tema SuperLopezGB de mlopezmad y launchings a juego.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar tema y launchings New-PandoraCypherV1OPTIMIZED
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/themes/pandora.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas/pandora.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#Temas/pandora.sh'
if grep -q "pandora.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "New-PandoraCypherV1OPTIMIZED ya se encuentra gamelist.xml"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#Temas/pandora.sh</path>\n\t\t<name>New-PandoraCypherV1OPTIMIZED theme + Launchings</name>\n\t\t<desc>Script para instalar el tema New-PandoraCypherV1OPTIMIZED del proyecto Plata-O-Roms y launchings a juego.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Crear directorio de fixes
if [ -d '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes' ]; then
        echo "Directorio fixes ya fue creado anteriormente... Borrando y descargando de nuevo..."
        sleep 2
        rm -R '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes'
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes'
else
        echo "Creando directorio Fixes y descargándolos..."
        sleep 2
        mkdir '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes'
fi

#Instalar fix installgamelist
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/installgamelist.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/installgamelist.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/installgamelist.sh'
if grep -q "installgamelist.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El fix installgamelist ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#fixes/installgamelist.sh</path>\n\t\t<name>Reinstalar Menu-Addons con gamelist original de retropie</name>\n\t\t<desc>Script para reinstalar el menu de addons descargando el gamelist del menu retropie original (necesario si por ejemplo cambian los nombres de los addons en gamelist.xml).</desc>\n\t\t<image>./#Menu-Addons/iconos/installgamelist.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar fix lr-gw
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/gw.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/gw.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/gw.sh'
if grep -q "gw.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El fix lr-gw ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#fixes/gw.sh</path>\n\t\t<name>Fix core lr-gw para Game and Watch</name>\n\t\t<desc>Script para reinstalar core anterior de Game and Watch para que funcione Donkey Kong Multi Screen. Aplicar si en el caso de actualizar el core se cuelga dicho juego al seleccionar Game A o Game B.</desc>\n\t\t<image>./#Menu-Addons/iconos/gw.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar fix lr-vice
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/vice.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/vice.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/vice.sh'
if grep -q "vice.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El fix lr-vice ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#fixes/vice.sh</path>\n\t\t<name>Fix core lr-vice para Commodore 64</name>\n\t\t<desc>Script para reinstalar core anterior de Commodore 64 (lr-vice) para que funcionen correctamente los juegos incluidos en la imagen. Aplicar si despues de actualizar el core no cargan bien los juegos o no funcionan los mapeados.</desc>\n\t\t<image>./#Menu-Addons/iconos/vice.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar fix lr-fbneo
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/fbneo.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/fbneo.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/fbneo.sh'
if grep -q "fbneo.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El fix lr-fbneo ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#fixes/fbneo.sh</path>\n\t\t<name>Fix core lr-fbneo</name>\n\t\t<desc>Script para reinstalar core anterior de Arcade FinalBurnNeo (lr-fbneo) para aquellos casos en los que tras actualizar dicho core no funciona algun juego incluido en la imagen.</desc>\n\t\t<image>./#Menu-Addons/iconos/fbneo.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar fix lr-scummvm
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/scummvm.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/scummvm.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/scummvm.sh'
if grep -q "scummvm.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El fix lr-scummvm ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#fixes/scummvm.sh</path>\n\t\t<name>Fix core lr-scummvm</name>\n\t\t<desc>Script para aplicar fix que restaura una version anterior de lr-scummvm debido a que en la ultima version algun control no funciona correctamente. Por ejemplo en Monkey Island 2 no se puede pasar la pantalla de las claves porque no se emula la tecla 5.</desc>\n\t\t<image>./#Menu-Addons/iconos/scummvm.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar fix retroarch
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/retroarch.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/retroarch.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/retroarch.sh'
if grep -q "retroarch.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El fix retroarch ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#fixes/retroarch.sh</path>\n\t\t<name>Fix retroarch</name>\n\t\t<desc>Script para aplicar fix que restaura una version anterior de retroarch (version que trae la imagen originalmente) debido a que en la ultima version algun core (emulador) no funciona de manera correcta.</desc>\n\t\t<image>./#Menu-Addons/iconos/retroarch.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Instalar fix emulationstation
wget -O- https://raw.githubusercontent.com/julenvitoria/6goldencoins_gpi2_cm4/main/menu-addons/emulationstation.sh>'/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/emulationstation.sh'
chmod +x '/home/pi/RetroPie/retropiemenu/#Menu-Addons/#fixes/emulationstation.sh'
if grep -q "emulationstation.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "El fix emulationstation ya se encuentra gamelist.xml"
else
        sed -i 's|</gameList>|\t<game>\n\t\t<path>./#Menu-Addons/#fixes/emulationstation.sh</path>\n\t\t<name>Fix emulationstation español</name>\n\t\t<desc>Script para reinstalar EmulationStation traducido a español gracias a @Jcarliman.</desc>\n\t\t<image>./#Menu-Addons/iconos/emulationstation.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#crear directorio de iconos y descargar
cd '/home/pi/RetroPie/retropiemenu/#Menu-Addons/'
echo "Descargando iconos del menu addons..."
sleep 2
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins_gpi2_cm4/tree/master/menu-addons/iconos

#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
