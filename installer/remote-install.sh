#!/usr/bin/env bash

echo -e "\n[INFO] Cloning OST"
cur_dir=$(pwd)
tmp_dir=$(mktemp -d)
cd "${tmp_dir}"
git clone git@gitlab.com:josebamartos/ost.git
"${tmp_dir}"/ost/installer/install.sh
cd "${cur_dir}"
rm -rf "${tmp_dir}"
