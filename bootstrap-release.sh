#! /bin/bash

echo TARGET="Release"
export PATH=`pwd`/depot_tools:$PATH
./bootstrap.sh
cd angle
gn gen out/$TARGET
echo 'target_cpu = "x64"' >> out/$TARGET/args.gn
echo 'is_debug = false' >> out/$TARGET/args.gn
gn gen out/$TARGET
