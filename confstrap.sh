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
    export CC="clang -stdlib=libc++"
    export CXX="clang++ -stdlib=libc++"
fi

# Gen for the first time
gn gen out/${TARGET}

# Edit args, per https://gn.googlesource.com/gn/+/master/docs/reference.md#cmd_args
cat > out/${TARGET}/args.gn << EOF
target_cpu = "x64"
is_clang = false
is_debug = $IS_DEBUG
angle_enable_gl = false
angle_enable_null = false
is_ggp = $IS_GGP
is_desktop_linux = $IS_LINUX
EOF

# Re-gen
gn gen out/${TARGET}
