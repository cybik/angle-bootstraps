#! /bin/bash

TARGET="${1}"
IS_GGP="false"
IS_LINUX="true"
IS_DEBUG="false"

[ "${TARGET}" == "Debug" ] && IS_DEBUG="true"
[ ! -z "${2}" ] && IS_GGP="true"
[ ! -z "${2}" ] && IS_LINUX="false"

cd angle
gn gen out/${TARGET}
cat >> out/${TARGET}/args.gn << EOF
target_cpu = "x64"
is_debug = $IS_DEBUG
angle_enable_gl = false
angle_enable_null = false
is_ggp = $IS_GGP
EOF
gn gen out/${TARGET}
