#!/bin/bash
# realizado para la imagen 6GoldenCoins de la gpi case 2 por @JulenSR

if grep off /home/pi/scripts/desactivado.txt
then
	#Modo bezels desactivados
	echo "Bezels desactivados, se prosigue la carga..."
	echo 0 > /home/pi/scripts/estado.txt
	exit 0
	#echo "desactivado" > /home/pi/scripts/bezels.txt
fi

if grep lcd /home/pi/scripts/modopantalla.txt
then
	if grep lcd /home/pi/scripts/modo.txt
	then
		echo 1 > /home/pi/scripts/estado.txt
		exit 0
	else
		#Aplicar Bezel GPI Case 2 (4:3 640x480)
		echo ""
		echo ""
		echo ""
		echo "Aplicando bezels 4:3... un momento, por favor :)"
		#Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
		find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
		find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
		cd /home/pi/scripts/bezels/bezelsgpiconf
		cp -R * /opt/retropie/configs/
		#cp /home/pi/RetroPie/script/atari5200/retroarch-1080.cfg /opt/retropie/configs/atari5200/retroarch.cfg
		sleep 0.5
		echo lcd > /home/pi/scripts/modo.txt
		echo "bezels aplicados para lcd" > /home/pi/scripts/bezels.txt
		echo 11 > /home/pi/scripts/estado.txt
	fi
fi

if grep hdmi /home/pi/scripts/modopantalla.txt
then
	if grep hdmi /home/pi/scripts/modo.txt
	then
		echo 2 > /home/pi/scripts/estado.txt
		exit 0
	else
		#Aplicar Bezel GPI Case 2 (16:9)
		echo ""
		echo ""
		echo ""
		echo "Aplicando bezels 16:9... un momento, por favor :)"
		#Buscamos y borramos todos los cfg en /roms para despues borrarlos, una vez borrados se procedera a copiar los seleccionados
		find /home/pi/RetroPie/roms/ -type f -name "*.cfg" -exec rm -f {} \;
		find /opt/retropie/configs/ -type f \( -name "retroarch.cfg" -a -not -wholename "*pc/retroarch.cfg" -wholename "*gameandwatch/retroarch.cfg" -wholename "*dreamcast/retroarch.cfg" -wholename "*all/retroarch.cfg" \)  -exec rm -f {} \;
		#Copiar pegar conservando atributos recursivamente
		cp -pr /home/pi/RetroPie/bezelsconfig/1080/* /
		#Copiamos el contenido de hacks de arcade a arcade y despues borramos el directorio hacks
		cp -pr '/home/pi/RetroPie/roms/arcade/# Hacks Arcade Games #/*.cfg' /home/pi/RetroPie/roms/arcade
		#rm -R /home/pi/RetroPie/roms/arcade/#\ Hacks\ Arcade\ Games\ #/
		#Copiamos los bezels de cps a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
		cp -pr /home/pi/RetroPie/roms/cps/*.cfg /home/pi/RetroPie/roms/arcade
		cp -pr '/home/pi/RetroPie/roms/cps/# Hacks Capcom Play System #/*.cfg' /home/pi/RetroPie/roms/arcade
		find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps\//opt\/retropie\/configs\/arcade/g'
		find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/arcade/g'
		find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/arcade/g'
		find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/arcade/g'
		#Copiamos los bezels de neogeo a arcade y cambiamos el directorio a donde apunta el remapping directory a arcade
		cp -pr /home/pi/RetroPie/roms/neogeo/*.cfg /home/pi/RetroPie/roms/arcade
		cp -pr '/home/pi/RetroPie/roms/neogeo/# Hacks Neo Geo #/*.cfg' /home/pi/RetroPie/roms/arcade
		find /home/pi/RetroPie/roms/arcade/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/neogeo\//opt\/retropie\/configs\/arcade/g'
		#Modificamos los cfg de cps para que apunten todos a /opt/retropie/configs/cps y no a cps1. cps2 y cps3
		find /home/pi/RetroPie/roms/cps/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps1\//opt\/retropie\/configs\/cps/g'
		find /home/pi/RetroPie/roms/cps/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps2\//opt\/retropie\/configs\/cps/g'
		find /home/pi/RetroPie/roms/cps/*.cfg -type f -print0 | xargs -0 sed -i 's/opt\/retropie\/configs\/cps3\//opt\/retropie\/configs\/cps/g'
		#Modificamos la ganacia de audio en los diferentes sistemas para que no distorsione con el nuevo mezclador pulseaudio
		find /opt/retropie/configs -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "0.000000"/'
		find /opt/retropie/configs/arcade -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
		find /opt/retropie/configs/cave -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
		find /opt/retropie/configs/cps -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
		find /opt/retropie/configs/cps1 -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
		find /opt/retropie/configs/cps2 -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
		find /opt/retropie/configs/cps3 -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
		find /opt/retropie/configs/vectrex -type f -name 'retroarch.cfg' | xargs sed -i 's/.*audio_volume = .*/audio_volume = "3"/'
		cp /home/pi/RetroPie/script/atari5200/retroarch-1080.cfg /opt/retropie/configs/atari5200/retroarch.cfg
		sleep 0.5
		find /home/pi/RetroPie/roms/ -name "*.cfg" -type f -print0 | xargs -0 sed -i 's/video_fullscreen_x/#video_fullscreen_x/g'
		find /home/pi/RetroPie/roms/ -name "*.cfg" -type f -print0 | xargs -0 sed -i 's/video_fullscreen_y/#video_fullscreen_y/g'
		sleep 0.5
		echo hdmi > /home/pi/scripts/modo.txt
		echo "bezels aplicados para hdmi" > /home/pi/scripts/bezels.txt
		echo 22 > /home/pi/scripts/estado.txt
	fi
fi

