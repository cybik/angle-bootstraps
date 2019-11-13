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
    # Config
    mkdir -p include/ggp_c
    cat > include/ggp_c/vulkan_types.h << EOF
typedef uint64_t GgpFrameToken;
typedef uint32_t GgpStreamDescriptor;
static const uint32_t kGgpPrimaryStreamDescriptor = 1;
EOF
    echo "Created include/ggp_c/vulkan_types.h"
else
    [ -f "include/ggp_c/vulkan_types.h" ] && bash -c 'rm -f include/ggp_c/vulkan_types.h; echo "ggp_c vulkan_types deleted"'
fi


# Gen for the first time
gn gen out/${TARGET}

# Edit args, per https://gn.googlesource.com/gn/+/master/docs/reference.md#cmd_args
cat > out/${TARGET}/args.gn << EOF
target_cpu = "x64"
is_debug = $IS_DEBUG
angle_enable_gl = false
angle_enable_null = false
is_ggp = $IS_GGP
is_desktop_linux = $IS_LINUX
EOF

# TODO: Force -stdlib=libc++

# Re-gen
gn gen out/${TARGET}
