#! /bin/bash

apt update
apt -y install git curl wget python sudo lsb-release ninja-build

# tzdata override
ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
DEBIAN_FRONTEND=noninteractive apt -y install tzdata