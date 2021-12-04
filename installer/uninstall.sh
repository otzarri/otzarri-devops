#!/usr/bin/env bash

_wd="$(realpath $(dirname ${0}))"  # Script's working dir
bin_src="${_wd}/../bin"
bin_dst="${HOME}/.local/bin"
cfg_src="${_wd}/../config"
cfg_dst="${HOME}/.config/ost"

echo -e "\n[INFO] Uninstalling OST"

if [[ -d "${cfg_dst}" ]]; then
    for file_src in "${bin_src}/*"; do
        file_dst="${bin_dst}/$(basename ${file_src})"
        if [[ -f "${file_dst}" ]]; then
            echo "[DELETE] ${file_dst}"
            rm ${file_dst}
        fi
    done
fi

if [[ -d "${cfg_dst}" ]]; then
    while [[ ! "${rm_cfg}" =~ ^(n|y)$ ]]; do
        read -r -p "Delete also config files? (y/n): " rm_cfg
    done

    if [[ "${rm_cfg}" == "y" ]]; then
        for file_src in "${cfg_src}/*"; do
            file_dst="${cfg_dst}/$(basename ${file_src})"
            if [[ -f "${file_dst}" ]]; then
                echo "[DELETE] ${file_dst}"
                rm ${file_dst}
            fi
        done
    fi

    if [[ -z "$(ls -A ${cfg_dst})" ]]; then
        echo "[WARNING] Directory ${cfg_dst} is empty"
        echo "[DELETE] ${cfg_dst}"
        rmdir "${cfg_dst}"
    fi
fi

echo -e "[INFO] Unistallation completed\n"
