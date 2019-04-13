#!/usr/bin/env bash
_wd="$(realpath $(dirname ${0}))"  # Script's working dir

bin_dir="${HOME}/.local/bin"

echo -e "Installing OST\n"

for filepath in ${_wd}/scripts/*; do
    if [[ "${filepath}" != */ost-* ]]; then
	dst="${bin_dir}/$(basename ${filepath})"
	echo "[COPY] ${filepath}  ->  ${dst}"
        cp ${filepath} ${dst}
	
	if [[ "${dst}" == /*.cfg ]]; then
	    chmod -x ${dst}
        else
            chmod +x ${dst}
        fi
    fi
done

echo
