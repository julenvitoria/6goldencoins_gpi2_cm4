Theme 'pandora box' v1.1
For use with EmulationStation


Changelog
=========


License
=======

-------------------------------------------------------------------------

Summary of the license below:

ALLOWED:      - Share and duplicate as it is
              - Edit, alter, change it

REQUIREMENTS: - Attribution, give credit to the creator
              - Indicate changes to it
              - Publish the changes under the same license

PROHIBITED:   - Commercial distribution

-------------------------------------------------------------------------

LOGO NOTICE

The used logos and trademarks are copyright of their respective owners.

-------------------------------------------------------------------------

Rehecho sobre anterior version por @cypher.delta:

-Tema renombrado como "New-Pandora.Cypher.V1"
-Cambiados logotipos de sistemas ahora en formato.png.
-Cambiado overlay que muestra el video en el gamelist.
-Reducido tiempo de espera (delay) para mostrar video.
-Pequeña modificacion estilistica en la pantalla de título adaptando los marcos azules.
-Cambiados sonidos de scroll y seleccion.


-------------------------------------------------------------------------


Cambios desconocidos en versiones anteriores a la v1.8.

-------------------------------------------------------------------------

v1.8 y v1.9  Se añaden nuevos logos y se corrige un error en la fuente.

-------------------------------------------------------------------------+

v1.10 Se añade logo del escritorio pixel.

-------------------------------------------------------------------------+

v1.11 Se cambia theme.xml de retropie para que aparezcan descripciones en vez de los controles.

-------------------------------------------------------------------------+

v2.0 Se cambian todos los theme.xml de cada sistema para que aparezcan descripciones y se limpian algunos archivos inecesarios.

-------------------------------------------------------------------------+
v2.1 Reparado sistema sgfx.
-------------------------------------------------------------------------+

v2.2 Reparado un error en la linea 264 de pandorabox.xml para que no cortase la última linea de titulos.

-------------------------------------------------------------------------+

v.2.3 Colocados botones en bg_wide.png y cambios el botones y letras de top_bg.png

-------------------------------------------------------------------------+

v.2.4 Cambio del logo de scummVM

-------------------------------------------------------------------------+

v.2.5 Añadido sistema cave

-------------------------------------------------------------------------+

v.2.6 Ajuste pantalla principal a varias resoluciones
se edito esto
de art/pandorabox.xml
de pandorabox.xml
	<view name="system">
		<image name="background" extra="true">
			<tile>false</tile>
			<size>0 1</size>
			<pos>0.5 0.5</pos>
			<origin>0.5 0.5</origin>
			<path>./art/top_bg.png</path>
por esto otro:
	<view name="system">
		<image name="background" extra="true">
			<tile>false</tile>
			<size>1 1</size>
			<pos>0 0</pos>
			<origin>0 0</origin>
			<path>./art/top_bg.png</path>

-------------------------------------------------------------------------+

v2.7 Añadido archivo perdido /art/centerface.png
Las opciones que tenia eran o poner el archivo (centerface.png) o editar el pandorabox.xml
para que no crease una entrada en el log
"opt/retropie/configs/all/emulationstation/es_log.txt"
Este log incluia:
  (from included file "/home/pi/.emulationstation/themes/PandoraBox_en azul/pandorabox.xml")
    could not find file "./art/centerfade.png" (which resolved to "/home/pi/.emulationstation/themes/PandoraBox_en azul/art/centerfade.png") 
Entre otras cosas...

-------------------------------------------------------------------------+
v2.8 Sin cambios en tema azul.
-------------------------------------------------------------------------+
v3 Creado cps
-------------------------------------------------------------------------+
NEWAZUL
Adaptarlo a versiones nuevas de emulationstation
Actualizarlo basandose en el Pandora theme by Ruckage 
Creados nuevos sistemas como pokemonnini.
Limpiar los xml y archivos sin uso en art.
