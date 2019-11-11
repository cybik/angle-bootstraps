#! /bin/bash

# Cloning
git clone https://github.com/FNA-XNA/angle-ggp angle
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

export DEPOT_TOOLS=`pwd`/depot_tools
export PATH=$DEPOT_TOOLS:$PATH
cd angle
scripts/bootstrap.py
gclient sync
sudo ./build/install-build-deps.sh
