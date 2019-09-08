#! /bin/bash

echo TARGET="Release"
export PATH=`pwd`/depot_tools:$PATH
./bootstrap.sh
cd angle
gn gen out/$TARGET
cat >> out/$TARGET/args.gn << EOF
target_cpu = "x64"
is_debug = true
angle_enable_gl = false
angle_enable_null = false
EOF
gn gen out/$TARGET
