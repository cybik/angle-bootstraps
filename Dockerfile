FROM ubuntu:bionic

RUN ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
RUN apt -y update; DEBIAN_FRONTEND=noninteractive apt -y install tzdata
# From the ANGLE repository, circa September 2019
RUN apt -y install git curl wget python sudo lsb-release ninja-build \
                   binutils bison bzip2 cdbs curl dbus-x11 dpkg-dev elfutils devscripts fakeroot \
                   flex git-core gperf libappindicator3-dev libasound2-dev libatspi2.0-dev \
                   libbrlapi-dev libbz2-dev libcairo2-dev libcap-dev libc6-dev libcups2-dev \
                   libcurl4-gnutls-dev libdrm-dev libelf-dev libffi-dev libgbm-dev libglib2.0-dev \
                   libglu1-mesa-dev libgnome-keyring-dev libgtk-3-dev libkrb5-dev libnspr4-dev \
                   libnss3-dev libpam0g-dev libpci-dev libpulse-dev libsctp-dev libspeechd-dev \
                   libsqlite3-dev libssl-dev libudev-dev libwww-perl libxslt1-dev libxss-dev \
                   libxt-dev libxtst-dev locales openbox p7zip patch perl pkg-config python \
                   python-cherrypy3 python-crypto python-dev python-numpy python-opencv \
                   python-openssl python-psutil python-yaml rpm ruby subversion uuid-dev \
                   wdiff x11-utils xcompmgr xz-utils zip
