#!/usr/bin/env bash

echo -e "\n[INFO] Cloning OST"
cd /tmp
git clone git@gitlab.com:josebamartos/ost.git
ost/installer/install.sh
