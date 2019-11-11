#! /bin/bash

TARGET="${1}"
IS_GGP="false"
IS_LINUX="true"
IS_DEBUG="false"
OUR_CC="gcc"
OUR_CXX="g++"

[ "${TARGET}" == "Debug" ] && IS_DEBUG="true"
if [ ! -z "${2}" ] && [ "${2}" == "ggp" ]; then
    IS_GGP="true"
    IS_LINUX="false"
    OUR_CC="clang"
    OUR_CXX="clang++ -stdlib=libc++"
fi

cd angle
gn gen out/${TARGET}
cat >> out/${TARGET}/args.gn << EOF
target_cpu = "x64"
is_debug = $IS_DEBUG
angle_enable_gl = false
angle_enable_null = false
is_ggp = $IS_GGP
cc = $OUR_CC
cxx = $OUR_CXX
EOF
gn gen out/${TARGET}
