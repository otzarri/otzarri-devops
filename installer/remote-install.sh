#!/usr/bin/env bash
action="${1}"
echo action
echo $action

echo -e "\n[INFO] Cloning otzarri-devops"
cur_dir=$(pwd)
tmp_dir=$(mktemp -d)
cd "${tmp_dir}"
git clone git@gitlab.com:josebamartos/ost.git
"${tmp_dir}"/ost/installer/install.sh "${action}"
cd "${cur_dir}"
rm -rf "${tmp_dir}"
