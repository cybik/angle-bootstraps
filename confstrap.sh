#! /bin/bash

TARGET="${1}"
IS_GGP="false"
IS_LINUX="true"
IS_DEBUG="false"
GN_TARGETOS="linux"

[ "${TARGET}" == "Debug" ] && IS_DEBUG="true"
if [ ! -z "${2}" ] && [ "${2}" == "ggp" ]; then
    IS_GGP="true"
    IS_LINUX="false"
    GN_TARGETOS="ggp"
fi

cd angle
gn gen out/${TARGET} --args="target_cpu=\"x64\" is_debug=${IS_DEBUG} angle_enable_gl=false angle_enable_null=false is_ggp=${IS_GGP} is_desktop_linux=${IS_LINUX} target_os=\"${GN_TARGETOS}\" use_custom_libcxx=${IS_GGP} angle_swiftshader=false"
