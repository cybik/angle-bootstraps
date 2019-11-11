#! /bin/bash

TARGET="${1}"
IS_GGP="false"
IS_LINUX="true"
IS_DEBUG="false"

[ "${TARGET}" == "Debug" ] && IS_DEBUG="true"
if [ ! -z "${2}" ] && [ "${2}" == "ggp" ]; then
    IS_GGP="true"
    IS_LINUX="false"
fi

cd angle
gn gen out/${TARGET}
cat >> out/${TARGET}/args.gn << EOF
target_cpu = "x64"
is_debug = $IS_DEBUG
angle_enable_gl = false
angle_enable_null = false
is_ggp = $IS_GGP
EOF
if [ ! -z "${2}" ] && [ "${2}" == "ggp" ]; then
cat >> out/${TARGET}/args.gn << EOF
cflags_cxx = "-stdlib=libc++"
EOF
fi
gn gen out/${TARGET}
