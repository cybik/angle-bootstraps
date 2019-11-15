#! /bin/bash

TARGET="${1}"

IS_DEBUG="false"
[ "${TARGET}" == "Debug" ] && IS_DEBUG="true"

# Either way it's Linux, but is this GGP or Desktop?
IS_GGP="false"
[ ! -z "${2}" ] && [ "${2}" == "ggp" ] && IS_GGP="true"

cd angle
gn gen out/${TARGET} --args="target_cpu=\"x64\" is_debug=${IS_DEBUG} angle_enable_gl=false angle_enable_null=false angle_swiftshader=false is_ggp=${IS_GGP} use_custom_libcxx=${IS_GGP}
