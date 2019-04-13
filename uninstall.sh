#!/usr/bin/env bash
_wd="$(realpath $(dirname ${0}))"  # Script's working dir

bin_dir="${HOME}/.local/bin"

echo -e "Unistalling OST\n"

for filepath in ${_wd}/scripts/*; do
    if [[ "${filepath}" != */ost-* ]]; then
	dst="${bin_dir}/$(basename ${filepath})"
	echo "[DELETE] ${dst}"
	if [[ -f ${dst} ]]; then rm ${dst}; fi
    fi
done

echo
