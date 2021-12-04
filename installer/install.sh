#!/usr/bin/env bash

_wd="$(realpath $(dirname ${0}))"  # Script's working dir
bin_src="${_wd}/../bin"
bin_dst="${HOME}/.local/bin"
cfg_src="${_wd}/../config"
cfg_dst="${HOME}/.config/ost"

echo -e "\n[INFO] Installing OST"

if [[ ! -d "${bin_dst}" ]]; then
    echo "[WARNING] Missing ${bin_dst} directory"
    echo "[INFO] Creating ${bin_dst} directory"
    mkdir "${bin_dst}"
fi

for file_src in "${bin_src}"/*; do
    file_dst="${bin_dst}/$(basename ${file_src})"
    echo "[COPY] ${file_src}  =>  ${file_dst}"
    cp -rp "${file_src}" "${file_dst}"
    chmod +x "${file_dst}"
done

if [[ ! -d "${cfg_dst}" ]]; then
    echo "[WARNING] Missing ${cfg_dst} directory"
    echo "[INFO] Creating ${cfg_dst} directory"
    mkdir "${cfg_dst}"
fi

for file_src in "${cfg_src}"/*; do
    file_dst="${cfg_dst}/$(basename ${file_src})"
    echo "[COPY] ${file_src}  =>  ${file_dst}"
    cp -rp "${file_src}" "${file_dst}"
done

echo -e "[INFO] Installation completed\n"
