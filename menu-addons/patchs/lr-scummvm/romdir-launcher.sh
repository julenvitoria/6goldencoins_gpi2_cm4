#!/usr/bin/env bash
ROM=$1; shift
SVM_FILES=()
[[ -d $ROM ]] && mapfile -t SVM_FILES < <(compgen -G "$ROM/*.svm")
[[ ${#SVM_FILES[@]} -eq 1 ]] && ROM=${SVM_FILES[0]}
/opt/retropie/emulators/retroarch/bin/retroarch \
    -L "/opt/retropie/libretrocores/lr-scummvm/scummvm_libretro.so" \
    --config "/opt/retropie/configs/scummvm/retroarch.cfg" \
    "$ROM" "$@"
