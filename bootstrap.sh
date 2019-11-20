#! /bin/bash

# Cloning
git clone https://chromium.googlesource.com/angle/angle
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

export BUILDROOT=`pwd`

# Add depot_tools to PATH, for gclient/gn and friends
export PATH=$BUILDROOT/depot_tools:$PATH

# Download everything else
cd angle
scripts/bootstrap.py
gclient sync
sudo ./build/install-build-deps.sh

# Apply custom patches for GGP public builds
git apply $BUILDROOT/patches/0001-HACK-Force-__ggp__-define.patch
git -C third_party/vulkan-loader/src apply $BUILDROOT/patches/0001-HACK-Stub-GGP-functions.patch
git -C third_party/vulkan-headers/src apply $BUILDROOT/patches/0001-GN-Make-PLATFORM_XCB-optional-based-on-a-user-define.patch

# This header has to be in Vulkan-Headers!
mkdir third_party/vulkan-headers/src/include/ggp_c
cat > third_party/vulkan-headers/src/include/ggp_c/vulkan_types.h << EOF
typedef uint64_t GgpFrameToken;
typedef uint32_t GgpStreamDescriptor;
static const uint32_t kGgpPrimaryStreamDescriptor = 1;
EOF
