#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
	vendor/lib/hw/audio.primary.sdm845.so)
	    "${PATCHELF}" --replace-needed libvndsecril-client.so libsecril-client.so "${2}"
            "${PATCHELF}" --add-needed libshim_audioparams.so "${2}"
            sed -i 's/str_parms_get_str/str_parms_get_mod/g' "${2}"
            ;;
	vendor/lib*/libwrappergps.so)
	    "${PATCHELF}" --replace-needed libvndsecril-client.so libsecril-client.so "${2}"
	    ;;
        vendor/lib*/libexynosdisplay.so|vendor/lib*/hw/hwcomposer.845.so|vendor/lib*/sensors.*.so)
            "${PATCHELF}" --replace-needed libutils.so libutils-v32.so "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=star2qltechn
export DEVICE_COMMON=sdm845-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
