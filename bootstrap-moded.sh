#! /bin/bash

TARGET="$1"
IS_DEBUG="false"
[ "${TARGET}" == "Debug" ] && IS_DEBUG="true"
export PATH=`pwd`/depot_tools:$PATH
./bootstrap.sh
cd angle
gn gen out/$TARGET
cat >> out/$TARGET/args.gn << EOF
target_cpu = "x64"
is_debug = $IS_DEBUG
angle_enable_gl = false
angle_enable_null = false
EOF
gn gen out/$TARGET
