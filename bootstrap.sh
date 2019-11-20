#! /bin/bash

# Cloning
git clone https://chromium.googlesource.com/angle/angle
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

# Add depot_tools to PATH, for gclient/gn and friends
export DEPOT_TOOLS=`pwd`/depot_tools
export PATH=$DEPOT_TOOLS:$PATH

# Download everything else
cd angle
scripts/bootstrap.py
gclient sync
sudo ./build/install-build-deps.sh

# Apply custom patches for GGP public builds
git am ../patches/0001-HACK-Force-__ggp__-define.patch
git --git-dir=third_party/vulkan-loader/src/.git am ../patches/0001-HACK-Stub-GGP-functions.patch
git --git-dir=third_party/vulkan-headers/src/.git am ../patches/0001-GN-Make-PLATFORM_XCB-optional-based-on-a-user-define.patch
