#! /bin/bash

export PATH=`pwd`/depot_tools:$PATH
./bootstrap.sh
./confstrap.sh ${1}