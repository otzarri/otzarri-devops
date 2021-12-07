#!/usr/bin/env bash
action="${1}"

echo -e "\n[INFO] Cloning otzarri-devops"
cur_dir=$(pwd)
tmp_dir=$(mktemp -d)
cd "${tmp_dir}"
git clone git@gitlab.com:josebamartos/otzarri-devops.git
"${tmp_dir}"/otzarri-devops/installer/install.sh "${action}"
cd "${cur_dir}"
rm -rf "${tmp_dir}"
