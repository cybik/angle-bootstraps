#! /bin/bash

# tzdata override
sudo bash -c 'ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime'
sudo bash -c 'DEBIAN_FRONTEND=noninteractive apt -y install tzdata'

# Cloning
git clone https://chromium.googlesource.com/angle/angle
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

export DEPOT_TOOLS=`pwd`/depot_tools
export PATH=$DEPOT_TOOLS:$PATH
cd angle
scripts/bootstrap.py
gclient sync
sudo ./build/install-build-deps.sh
