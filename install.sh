#!/usr/bin/env bash

_wd="$(realpath $(dirname ${0}))"  # Script's working dir
bin_dir="${HOME}/.local/bin"

echo -e "\nInstalling OST"

if [ ! -d "${bin_dir}" ]; then
    mkdir -p ${bin_dir};
    echo "[MKDIR] ${bin_dir}" 
fi

for filepath in ${_wd}/scripts/*; do
    if [[ "${filepath}" != */ost-* ]]; then
	dst="${bin_dir}/$(basename ${filepath})"
	echo "[COPY] ${filepath}  =>  ${dst}"
        cp ${filepath} ${dst}
	
	if [[ "${dst}" == /*.cfg ]]; then
	    chmod -x ${dst}
        else
            chmod +x ${dst}
        fi
    fi
done

echo
