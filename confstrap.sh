#! /bin/bash

TARGET="${1}"

IS_DEBUG="false"
[ "${TARGET}" == "Debug" ] && IS_DEBUG="true"

# Either way it's Linux, but is this GGP or Desktop?
IS_GGP="false"
USE_X11="true"
if [ ! -z "${2}" ] && [ "${2}" == "ggp" ]; then
    IS_GGP="true"
    USE_X11="false"
fi

cd angle
gn gen out/${TARGET} --args="target_cpu=\"x64\" is_debug=${IS_DEBUG} angle_enable_gl=false angle_enable_null=false is_ggp=${IS_GGP} angle_use_x11=${USE_X11} use_custom_libcxx=${IS_GGP} angle_swiftshader=false"
