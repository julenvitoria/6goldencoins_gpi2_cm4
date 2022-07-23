#!/bin/bash

clear
echo ""
echo ""
echo ""
if [ ! "`ping -c 1 github.com`" ]
then
  echo "No hay conexion con GitHub.com"
  sleep 3
  exit 0
fi

echo "Conexion con GitHub.com establecida, continuando..."
sleep 2
if [ -d "/home/pi/scripts/tmp/" ]; then
    echo "Borrando directorio temporal..."
    echo ""
    rm -r "/home/pi/scripts/tmp/"
    sleep 1
fi
echo "Descargando core lr-vice y aplicando fix..."
echo ""
mkdir /home/pi/scripts/tmp/
cd /home/pi/scripts/tmp/
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoinspi4/tree/master/menu-addons/patchs/lr-vice
sudo rm -R /opt/retropie/libretrocores/lr-vice
sudo cp -R lr-vice /opt/retropie/libretrocores/
sudo chmod +x /opt/retropie/libretrocores/lr-vice/vice_x64_libretro.so
cd ~
rm -r "/home/pi/scripts/tmp/"
sleep 2
#modificamos /opt/retropie/configs/all/retroarch_core_options.cfg
sed -i '/^vice_/d' /opt/retropie/configs/all/retroarch-core-options.cfg
sed -i '$a vice_analogmouse_deadzone = \"15\"\nvice_analogmouse_speed = \"1.0\"\nvice_aspect_ratio = \"auto\"\nvice_audio_leak_emulation = \"disabled\"\nvice_audio_options_display = \"disabled\"\nvice_autoloadwarp = \"enabled\"\nvice_autostart = \"enabled\"\nvice_autostart_warp = \"enabled\"\nvice_border = \"disabled\"\nvice_c64_model = \"C64 PAL\"\nvice_datasette_hotkeys = \"disabled\"\nvice_dpadmouse_speed = \"6\"\nvice_drive_sound_emulation = \"20%\"\nvice_drive_true_emulation = \"disabled\"\nvice_external_palette = \"colodore\"\nvice_gfx_colors = \"16bit\"\nvice_jiffydos = \"enabled\"\nvice_joyport = \"Port 2\"\nvice_joyport_type = \"1\"\nvice_keyboard_keymap = \"positional\"\nvice_keyrah_keypad_mappings = \"disabled\"\nvice_manual_crop_bottom = \"0\"\nvice_manual_crop_left = \"0\"\nvice_manual_crop_right = \"0\"\nvice_manual_crop_top = \"0\"\nvice_mapper_a = \"---\"\nvice_mapper_b = \"---\"\nvice_mapper_datasette_forward = \"---\"\nvice_mapper_datasette_reset = \"---\"\nvice_mapper_datasette_rewind = \"---\"\nvice_mapper_datasette_start = \"---\"\nvice_mapper_datasette_stop = \"---\"\nvice_mapper_datasette_toggle_hotkeys = \"---\"\nvice_mapper_joyport_switch = \"RETROK_F3\"\nvice_mapper_l = \"RETROK_F5\"\nvice_mapper_l2 = \"RETROK_y\"\nvice_mapper_l3 = \"RETROK_ESCAPE\"\nvice_mapper_ld = \"---\"\nvice_mapper_ll = \"---\"\nvice_mapper_lr = \"---\"\nvice_mapper_lu = \"---\"\nvice_mapper_r = \"SWITCH_JOYPORT\"\nvice_mapper_r2 = \"RETROK_n\"\nvice_mapper_r3 = \"RETROK_BACKSPACE\"\nvice_mapper_rd = \"---\"\nvice_mapper_reset = \"RETROK_F4\"\nvice_mapper_rl = \"---\"\nvice_mapper_rr = \"---\"\nvice_mapper_ru = \"---\"\nvice_mapper_select = \"---\"\nvice_mapper_start = \"TOGGLE_VKBD\"\nvice_mapper_statusbar = \"RETROK_F2\"\nvice_mapper_vkbd = \"RETROK_F1\"\nvice_mapper_warp_mode = \"RETROK_F6\"\nvice_mapper_x = \"RETROK_RETURN\"\nvice_mapper_y = \"RETROK_SPACE\"\nvice_mapper_zoom_mode_toggle = \"RETROK_F5\"\nvice_mapping_options_display = \"enabled\"\nvice_mouse_speed = \"100\"\nvice_physical_keyboard_pass_through = \"disabled\"\nvice_read_vicerc = \"enabled\"\nvice_reset = \"Autostart\"\nvice_resid_8580filterbias = \"1500\"\nvice_resid_filterbias = \"500\"\nvice_resid_gain = \"97\"\nvice_resid_passband = \"90\"\nvice_resid_sampling = \"Resampling\"\nvice_retropad_options = \"jump\"\nvice_sid_engine = \"ReSID\"\nvice_sid_extra = \"disabled\"\nvice_sid_model = \"Default\"\nvice_sound_sample_rate = \"48000\"\nvice_statusbar = \"bottom\"\nvice_theme = \"1\"\nvice_turbo_fire_button = \"disabled\"\nvice_turbo_pulse = \"4\"\nvice_userport_joytype = \"None\"\nvice_vicii_color_brightness = \"900\"\nvice_vicii_color_contrast = \"1200\"\nvice_vicii_color_gamma = \"2800\"\nvice_vicii_color_saturation = \"1000\"\nvice_video_options_display = \"enabled\"\nvice_vkbd_alpha = \"20%\"\nvice_vkbd_theme = \"0\"\nvice_work_disk = \"disabled\"\nvice_zoom_mode = \"medium\"\nvice_zoom_mode_crop = \"both\"' /opt/retropie/configs/all/retroarch-core-options.cfg
if [ -f "/opt/retropie/configs/c64/VICE x64/VICE x64.rmp" ]; then
    rm "/opt/retropie/configs/c64/VICE x64/VICE x64.rmp"
fi
cd '/opt/retropie/configs/c64/VICE x64/'
/home/pi/scripts/github-downloader.sh https://github.com/julenvitoria/6goldencoinspi4/blob/master/menu-addons/patchs/VICE%20x64.rmp
cd -