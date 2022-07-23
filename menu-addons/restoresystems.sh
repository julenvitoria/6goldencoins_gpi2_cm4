#!/bin/bash

echo ""
echo ""
echo "Verificando y restaurando los sistemas que faltan... ;)"
sleep 2

#mod es_systems.cfg file

#openbor
if grep -q "<name>openbor</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema OpenBOR ya existe, nada que modificar..."
else
        echo "Añadiendo OPENBOR"
        sudo sed -i 's|</systemList>|  <system>\n    <name>openbor</name>\n    <fullname>OpenBOR</fullname>\n    <path>/home/pi/RetroPie/roms/openbor</path>\n    <extension>.bor .BOR .Bor .PAK .pak .Pak .PAk .paK .pAk</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _PORT_ openbor %ROM%</command>\n    <platform>openbor</platform>\n    <theme>openbor</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

#pce-cd
if grep -q "<name>pce-cd</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema PC Engine CD ya existe, nada que modificar..."
else
        echo "Añadiendo PCE-CD"
        sudo sed -i 's|</systemList>|  <system>\n    <name>pce-cd</name>\n    <fullname>PC Engine CD</fullname>\n    <path>/home/pi/RetroPie/roms/pce-cd</path>\n    <extension>.pce .ccd .cue .zip .PCE .CCD .CUE .ZIP .chd .CHD</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ pce-cd %ROM%</command>\n    <platform>pce-cd</platform>\n    <theme>pce-cd</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

#cps
if grep -q "<name>cps</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema Capcom Play System ya existe, nada que modificar..."
else
        echo "Añadiendo CPS"
        sudo sed -i 's|</systemList>|  <system>\n    <name>cps</name>\n    <fullname>Capcom Play System</fullname>\n    <path>/home/pi/RetroPie/roms/cps</path>\n    <extension>.32x .32X .a26 .A26 .a52 .A52 .a78 .A78 .adf .ADF .adz .ADZ .asc .ASC .atr .ATR .ATR .bas .BAS .BAS .bat .BAT .bin .BIN .car .CAR .cas .CAS .cbn .CBN .ccc .CCC .ccd .CCD .cdi .CDI .cdt .CDT .chd .CHD .col .COL .com .COM .COM .conf .CONF .cpc .CPC .crt .CRT .cso .CSO .ctr .CTR .cue .CUE .d64 .D64 .daphne .DAPHNE .dat .DAT .dcm .DCM .dmk .DMK .dms .DMS .dsk .DSK .DSK .exe .EXE .fba .FBA .fds .FDS .fig .FIG .g64 .G64 .gam .GAM .gb .GB .gba .GBA .gbc .GBC .gdi .GDI .gen .GEN .gg .GG .gz .GZ .GZ .img .IMG .IMG .int .INT .ipf .IPF .IPF .iso .ISO .ISO .jvc .JVC .lnx .LNX .m3u .M3U .md .MD .mdf .MDF .mgd .MGD .mgt .MGT .mgw .MGW .mx1 .MX1 .mx2 .MX2 .n64 .N64 .nds .NDS .nes .NES .ngc .NGC .ngp .NGP .nib .NIB .os9 .OS9 .pbp .PBP .PBP .pce .PCE .po .PO .prg .PRG .raw .RAW .rom .ROM .ROM .rp .scl .SCL .sfc .SFC .sg .SG .smc .SMC .smd .SMD .sms .SMS .sna .SNA .SNA .st .ST .stx .STX .svm .SVM .swc .SWC .szx .SZX .t64 .T64 .tap .TAP .toc .TOC .trd .TRD .tzx .TZX .udi .UDI .v64 .V64 .vb .VB .vdk .VDK .vec .VEC .vsf .VSF .wav .WAV .ws .WS .wsc .WSC .x64 .X64 .xex .XEX .xfd .XFD .XFD .z .Z .z1 .Z1 .z2 .Z2 .z3 .Z3 .z4 .Z4 .z5 .Z5 .z6 .Z6 .z64 .Z64 .z7 .Z7 .z8 .Z8 .z80 .Z80 .zip .ZIP .znx .ZNX .7z</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ cps %ROM%</command>\n    <platform>cps</platform>\n    <theme>cps</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

#cps1   
if grep -q "<name>cps1</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema Capcom Play System I ya existe, nada que modificar..."
else
        echo "Añadiendo CPS1"
        sudo sed -i 's|</systemList>|  <system>\n    <name>cps1</name>\n    <fullname>Capcom Play System I</fullname>\n    <path>/home/pi/RetroPie/roms/cps1</path>\n    <extension>.32x .32X .a26 .A26 .a52 .A52 .a78 .A78 .adf .ADF .adz .ADZ .asc .ASC .atr .ATR .ATR .bas .BAS .BAS .bat .BAT .bin .BIN .car .CAR .cas .CAS .cbn .CBN .ccc .CCC .ccd .CCD .cdi .CDI .cdt .CDT .chd .CHD .col .COL .com .COM .COM .conf .CONF .cpc .CPC .crt .CRT .cso .CSO .ctr .CTR .cue .CUE .d64 .D64 .daphne .DAPHNE .dat .DAT .dcm .DCM .dmk .DMK .dms .DMS .dsk .DSK .DSK .exe .EXE .fba .FBA .fds .FDS .fig .FIG .g64 .G64 .gam .GAM .gb .GB .gba .GBA .gbc .GBC .gdi .GDI .gen .GEN .gg .GG .gz .GZ .GZ .img .IMG .IMG .int .INT .ipf .IPF .IPF .iso .ISO .ISO .jvc .JVC .lnx .LNX .m3u .M3U .md .MD .mdf .MDF .mgd .MGD .mgt .MGT .mgw .MGW .mx1 .MX1 .mx2 .MX2 .n64 .N64 .nds .NDS .nes .NES .ngc .NGC .ngp .NGP .nib .NIB .os9 .OS9 .pbp .PBP .PBP .pce .PCE .po .PO .prg .PRG .raw .RAW .rom .ROM .ROM .rp .scl .SCL .sfc .SFC .sg .SG .smc .SMC .smd .SMD .sms .SMS .sna .SNA .SNA .st .ST .stx .STX .svm .SVM .swc .SWC .szx .SZX .t64 .T64 .tap .TAP .toc .TOC .trd .TRD .tzx .TZX .udi .UDI .v64 .V64 .vb .VB .vdk .VDK .vec .VEC .vsf .VSF .wav .WAV .ws .WS .wsc .WSC .x64 .X64 .xex .XEX .xfd .XFD .XFD .z .Z .z1 .Z1 .z2 .Z2 .z3 .Z3 .z4 .Z4 .z5 .Z5 .z6 .Z6 .z64 .Z64 .z7 .Z7 .z8 .Z8 .z80 .Z80 .zip .ZIP .znx .ZNX .7z</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ cps1 %ROM%</command>\n    <platform>cps1</platform>\n    <theme>cps1</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

#cps2
if grep -q "<name>cps2</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema Capcom Play System II ya existe, nada que modificar..."
else
        echo "Añadiendo CPS2"
        sudo sed -i 's|</systemList>|  <system>\n    <name>cps2</name>\n    <fullname>Capcom Play System II</fullname>\n    <path>/home/pi/RetroPie/roms/cps2</path>\n    <extension>.32x .32X .a26 .A26 .a52 .A52 .a78 .A78 .adf .ADF .adz .ADZ .asc .ASC .atr .ATR .ATR .bas .BAS .BAS .bat .BAT .bin .BIN .car .CAR .cas .CAS .cbn .CBN .ccc .CCC .ccd .CCD .cdi .CDI .cdt .CDT .chd .CHD .col .COL .com .COM .COM .conf .CONF .cpc .CPC .crt .CRT .cso .CSO .ctr .CTR .cue .CUE .d64 .D64 .daphne .DAPHNE .dat .DAT .dcm .DCM .dmk .DMK .dms .DMS .dsk .DSK .DSK .exe .EXE .fba .FBA .fds .FDS .fig .FIG .g64 .G64 .gam .GAM .gb .GB .gba .GBA .gbc .GBC .gdi .GDI .gen .GEN .gg .GG .gz .GZ .GZ .img .IMG .IMG .int .INT .ipf .IPF .IPF .iso .ISO .ISO .jvc .JVC .lnx .LNX .m3u .M3U .md .MD .mdf .MDF .mgd .MGD .mgt .MGT .mgw .MGW .mx1 .MX1 .mx2 .MX2 .n64 .N64 .nds .NDS .nes .NES .ngc .NGC .ngp .NGP .nib .NIB .os9 .OS9 .pbp .PBP .PBP .pce .PCE .po .PO .prg .PRG .raw .RAW .rom .ROM .ROM .rp .scl .SCL .sfc .SFC .sg .SG .smc .SMC .smd .SMD .sms .SMS .sna .SNA .SNA .st .ST .stx .STX .svm .SVM .swc .SWC .szx .SZX .t64 .T64 .tap .TAP .toc .TOC .trd .TRD .tzx .TZX .udi .UDI .v64 .V64 .vb .VB .vdk .VDK .vec .VEC .vsf .VSF .wav .WAV .ws .WS .wsc .WSC .x64 .X64 .xex .XEX .xfd .XFD .XFD .z .Z .z1 .Z1 .z2 .Z2 .z3 .Z3 .z4 .Z4 .z5 .Z5 .z6 .Z6 .z64 .Z64 .z7 .Z7 .z8 .Z8 .z80 .Z80 .zip .ZIP .znx .ZNX .7z</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ cps2 %ROM%</command>\n    <platform>cps2</platform>\n    <theme>cps2</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

#cps3
if grep -q "<name>cps3</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema Capcom Play System III ya existe, nada que modificar..."
else
        echo "Añadiendo CPS3"
        sudo sed -i 's|</systemList>|  <system>\n    <name>cps3</name>\n    <fullname>Capcom Play System III</fullname>\n    <path>/home/pi/RetroPie/roms/cps3</path>\n    <extension>.32x .32X .a26 .A26 .a52 .A52 .a78 .A78 .adf .ADF .adz .ADZ .asc .ASC .atr .ATR .ATR .bas .BAS .BAS .bat .BAT .bin .BIN .car .CAR .cas .CAS .cbn .CBN .ccc .CCC .ccd .CCD .cdi .CDI .cdt .CDT .chd .CHD .col .COL .com .COM .COM .conf .CONF .cpc .CPC .crt .CRT .cso .CSO .ctr .CTR .cue .CUE .d64 .D64 .daphne .DAPHNE .dat .DAT .dcm .DCM .dmk .DMK .dms .DMS .dsk .DSK .DSK .exe .EXE .fba .FBA .fds .FDS .fig .FIG .g64 .G64 .gam .GAM .gb .GB .gba .GBA .gbc .GBC .gdi .GDI .gen .GEN .gg .GG .gz .GZ .GZ .img .IMG .IMG .int .INT .ipf .IPF .IPF .iso .ISO .ISO .jvc .JVC .lnx .LNX .m3u .M3U .md .MD .mdf .MDF .mgd .MGD .mgt .MGT .mgw .MGW .mx1 .MX1 .mx2 .MX2 .n64 .N64 .nds .NDS .nes .NES .ngc .NGC .ngp .NGP .nib .NIB .os9 .OS9 .pbp .PBP .PBP .pce .PCE .po .PO .prg .PRG .raw .RAW .rom .ROM .ROM .rp .scl .SCL .sfc .SFC .sg .SG .smc .SMC .smd .SMD .sms .SMS .sna .SNA .SNA .st .ST .stx .STX .svm .SVM .swc .SWC .szx .SZX .t64 .T64 .tap .TAP .toc .TOC .trd .TRD .tzx .TZX .udi .UDI .v64 .V64 .vb .VB .vdk .VDK .vec .VEC .vsf .VSF .wav .WAV .ws .WS .wsc .WSC .x64 .X64 .xex .XEX .xfd .XFD .XFD .z .Z .z1 .Z1 .z2 .Z2 .z3 .Z3 .z4 .Z4 .z5 .Z5 .z6 .Z6 .z64 .Z64 .z7 .Z7 .z8 .Z8 .z80 .Z80 .zip .ZIP .znx .ZNX .7z</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ cps3 %ROM%</command>\n    <platform>cps3</platform>\n    <theme>cps3</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

#light gun
if grep -q "<name>Light-Gun-collection</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema Light-Gun-collection ya existe, nada que modificar..."
else
        echo "Añadiendo LIGHT-GUN-COLLECTION"
        sudo sed -i 's|</systemList>|  <system>\n    <name>Light-Gun-collection</name>\n    <fullname>Light-Gun-collection</fullname>\n    <path>/home/pi/RetroPie/roms/mame-advmame</path>\n    <extension>.zip .ZIP .7z .7Z</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ mame-advmame %ROM%</command>\n    <platform>arcade</platform>\n    <theme>Light-Gun-collection</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

#pokemon mini
if grep -q "<name>pokemini</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema Pokemon Mini ya existe, nada que modificar..."
else
        echo "Añadiendo POKEMON MINI"
        sudo sed -i 's|</systemList>|  <system>\n    <name>pokemini</name>\n    <fullname>Pokemon Mini</fullname>\n    <path>/home/pi/RetroPie/roms/pokemini</path>\n    <extension>.min .zip .MIN .ZIP</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ pokemini %ROM%</command>\n    <platform>pokemini</platform>\n    <theme>pokemini</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

#kodi
if grep -q "<name>kodi</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema kodi ya existe, nada que modificar..."
else
        echo "Añadiendo KODI"
        sudo sed -i 's|</systemList>|  <system>\n    <name>kodi</name>\n    <fullname>kodi</fullname>\n    <path>~/RetroPie/roms/kodi</path>\n    <extension>.sh .SH</extension>\n    <command>%ROM%</command>\n    <platform>kodi</platform>\n    <theme>kodi</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

#pixel
if grep -q "<name>pixel</name>" /opt/retropie/configs/all/emulationstation/es_systems.cfg ; then
        echo "Sistema Pixel ya existe, nada que modificar..."
else
        echo "Añadiendo PIXEL"
        sudo sed -i 's|</systemList>|  <system>\n    <name>pixel</name>\n    <fullname>Pixel Desktop</fullname>\n    <path>~/RetroPie/roms/pixel</path>\n    <extension>.sh .SH .7z</extension>\n    <command>bash %ROM%</command>\n    <platform>pixel</platform>\n    <theme>pixel</theme>\n  </system>\n</systemList>|' /opt/retropie/configs/all/emulationstation/es_systems.cfg
fi

echo ""
echo ""
echo "RestoreSystems fix applied!!!"
sleep 3
#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
