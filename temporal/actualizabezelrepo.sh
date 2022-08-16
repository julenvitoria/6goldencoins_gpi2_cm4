#!/bin/bash
#By Kactius, Julenvitoria, Re_tux
#clone, pull repo, delete and clone
dialog --backtitle "Plata o ROMs v3 clone or pull repo" --title " ¡¡¡¡Informacion!!!! " \
--infobox "


              LEA ATENTAMENTE!!
    Por favor tenga en cuenta:
    1-Es necesario disponer de conexion a internet.
      Estable y valida.
    2-Disponer de espacio necesario 1GB aproximado.
    3-Una vez realizado el clonado o pull del repo.
    4-TENDRA que aplicar los cambios.
    5-USE la opcion APLICAR BEZEL segun su resolución." 16 55
sleep 10
INPUT=/tmp/actualizarbezelrepo.sh.$$
dialog --backtitle "Plata o ROMs v3 clone or pull repo" \
--title "Opciones extra - repo bezel" \
--default-item 3 \
--ok-label Aplicar \
--cancel-label Salir \
--menu " Seleccionar (arriba/abajo) presiona A para aceptar
Ambas opciones actualizan
1 No modifica tus cambios (incremental)
2 Borra y descarga todo (completa) : " 16 55 3 \
   1 "Aplicar Clonado o pull(actualizar)" \
   2 "Restablecer y descargar todos" \
   3 "Ir Atras" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)#Actualizar Bezels GPI Case 2
    clear
    echo ""
    echo ""
    echo ""
    #comprobamos la conexion a github
    if [ ! "`ping -c 1 github.com`" ]; then
        echo "No hay conexion con GitHub.com"
        echo "Por favor, revisa tu conexion."
        sleep 4
    else
		echo "Conexion con GitHub.com establecida, continuando..."
        sleep 2
		#Comprobacion si existe o no ".git en /home/pi/RetroPie/.git"
		#Si existe aplica el pull (actualizacion parcial)
		file="/home/pi/RetroPie/.git"
		if [ -d "$file" ]
		then
			echo "$file encontrado"
			echo "Se realizara un pull (actualizacion parcial) en /home/pi/RetroPie"
			sleep 5
			cd /home/pi/RetroPie
			git pull
			echo "Realizado pull"
		echo "Cambiado de permisos"
		sudo chown -R -c pi:pi /home/pi/RetroPie/bezelsconfig
		sudo chown -R -c pi:pi /home/pi/RetroPie/bezels
			sudo chown -R -c pi:pi /home/pi/RetroPie/.git
		#si NO existe se realiza clonado
		else
			echo "$file NOOOO estaba"
			echo "Se realizara un clonado en /home/pi/RetroPie/script/tempbezel"
			git clone https://github.com/ReTTux/ReTTux-Bezels-cfg_v3 /home/pi/RetroPie/script/tempbezel
			echo "Clonado supuestamente finalizado en /home/pi/RetroPie/script/tempbezel"
			mv /home/pi/RetroPie/script/tempbezel/* /home/pi/RetroPie/
			mv /home/pi/RetroPie/script/tempbezel/\.git* /home/pi/RetroPie/
			echo "Movido de tempbezel a RetroPie"
		sleep 2
		sudo chown -R -c pi:pi /home/pi/RetroPie/bezelsconfig
			sudo chown -R -c pi:pi /home/pi/RetroPie/bezels
		sudo chown -R -c pi:pi /home/pi/RetroPie/.git
			rm -rf /home/pi/RetroPie/script/tempbezel
			echo "Borrado tempbezel realizado"
		sleep 2
		#revisamos si existe el directorio a donde descargaremos y si existe se borra para descargar de nuevo
        if [ -d "/home/pi/scripts/bezels/" ]; then
            sudo rm -R "/home/pi/scripts/bezels/"
            sleep 1
        fi
        echo "Descargando bezels para GPI Case 2 4:3..."
        sleep 2
        #descargamos los bezels y los configs
        cd /home/pi/scripts
        /home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins_gpi2_cm4/tree/master/bezels
        sudo chown -R pi:pi /home/pi/scripts/bezels
		fi
	sleep 4
	sudo /home/pi/RetroPie/script/MenuPlataoroms.sh;
	clear ;;
  2)#Actualizar Bezels GPI Case 2
    clear
    echo ""
    echo ""
    echo ""
    #comprobamos la conexion a github
    if [ ! "`ping -c 1 github.com`" ]; then
        echo "No hay conexion con GitHub.com"
        echo "Por favor, revisa tu conexion."
        sleep 4
    else
		echo "Conexion con GitHub.com establecida, continuando..."
        sleep 2
		#Restablecer y descargar todo
		rm -rf /home/pi/RetroPie/bezels
		rm -rf /home/pi/RetroPie/bezelsconfig
		rm -rf /home/pi/RetroPie/.git*
		echo "Borrado lo necesario realizado"
		echo "Se realizara un clonado"
		git clone https://github.com/ReTTux/ReTTux-Bezels-cfg_v3 /home/pi/RetroPie/script/tempbezel
		echo "Clonado supuestamente finalizado en /home/pi/RetroPie/script/tempbezel"
		mv /home/pi/RetroPie/script/tempbezel/* /home/pi/RetroPie/
		mv /home/pi/RetroPie/script/tempbezel/\.git* /home/pi/RetroPie/
		echo "Movido de tempbezel a RetroPie"
		sleep 2
		sudo chown -R -c pi:pi /home/pi/RetroPie/bezelsconfig
		sudo chown -R -c pi:pi /home/pi/RetroPie/bezels
		sudo chown -R -c pi:pi /home/pi/RetroPie/.git
		sleep 2
		echo "Cambiado de permisos realizado"
		rm -rf /home/pi/RetroPie/script/tempbezel
		echo "borrado tempbezel"
		sleep 2
		#revisamos si existe el directorio a donde descargaremos y si existe se borra para descargar de nuevo
        if [ -d "/home/pi/scripts/bezels/" ]; then
            sudo rm -R "/home/pi/scripts/bezels/"
            sleep 1
        fi
        echo "Descargando bezels para GPI Case 2 4:3..."
        sleep 2
        #descargamos los bezels y los configs
        cd /home/pi/scripts
        /home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoins_gpi2_cm4/tree/master/bezels
        sudo chown -R pi:pi /home/pi/scripts/bezels
	sleep 4
	sudo /home/pi/RetroPie/script/MenuPlataoroms.sh;
	clear ;;
  3)#Volver a MenuPlataoroms.sh
    sudo /home/pi/RetroPie/script/MenuPlataoroms.sh ;;
esac
