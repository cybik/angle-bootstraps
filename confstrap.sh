#! /bin/bash

TARGET="${1}"
IS_GGP="false"
IS_LINUX="true"
IS_DEBUG="false"

cd angle

[ "${TARGET}" == "Debug" ] && IS_DEBUG="true"
if [ ! -z "${2}" ] && [ "${2}" == "ggp" ]; then
    IS_GGP="true"
    IS_LINUX="false"
fi

gn gen out/${TARGET} --args='target_cpu=x64 is_debug=$IS_DEBUG angle_enable_gl=false angle_enable_null=false is_ggp=$IS_GGP is_desktop_linux=$IS_LINUX use_custom_libcxx=$IS_GGP'
