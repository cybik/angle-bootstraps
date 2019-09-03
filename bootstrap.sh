#! /bin/bash
git clone https://chromium.googlesource.com/angle/angle
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

export PATH=`pwd`/depot_tools:$PATH
cd angle
scripts/bootstrap.py
