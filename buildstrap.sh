#! /bin/bash

./bootstrap-${1}.sh

cd angle;
for TGT in libEGL libGLESv1_CM libGLESv2; do 
    ninja -C out/${1} $TGT;
done;