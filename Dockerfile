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

RUN dpkg --add-architecture i386 && apt update && \
    apt -y install ant ant-optional apache2 apache2-bin apache2-data apache2-utils \
            binutils-aarch64-linux-gnu binutils-arm-linux-gnueabihf \
            binutils-mingw-w64-i686 binutils-mips64el-linux-gnuabi64 \
            binutils-mipsel-linux-gnu ca-certificates-java cmake cmake-data \
            cpp-5-arm-linux-gnueabihf cpp-7-arm-linux-gnueabihf cpp-arm-linux-gnueabihf \
            default-jre-headless g++-5-arm-linux-gnueabihf \
            g++-5-multilib-arm-linux-gnueabihf g++-7-arm-linux-gnueabihf \
            g++-arm-linux-gnueabihf g++-mingw-w64-i686 gawk gcc-5-arm-linux-gnueabihf \
            gcc-5-arm-linux-gnueabihf-base gcc-5-cross-base \
            gcc-5-multilib-arm-linux-gnueabihf gcc-7-arm-linux-gnueabihf \
            gcc-7-arm-linux-gnueabihf-base gcc-7-cross-base gcc-8-base:i386 \
            gcc-8-cross-base gcc-arm-linux-gnueabihf gcc-mingw-w64-base \
            gcc-mingw-w64-i686 java-common lib32ncurses5 lib32ncurses5-dev \
            lib32tinfo-dev lib32tinfo5 lib32z1 lib32z1-dev libapache2-mod-php7.2 \
            libaprutil1-dbd-sqlite3 libaprutil1-ldap libargon2-0 libasan2-armhf-cross \
            libasan4-armhf-cross libasound2:i386 libatomic1-armhf-cross libblkid1:i386 \
            libbluetooth-dev libbluetooth3 libbsd0:i386 libc6:i386 \
            libc6-armel-armhf-cross libc6-armel-cross libc6-armhf-cross libc6-dev:i386 \
            libc6-dev-armel-armhf-cross libc6-dev-armel-cross libc6-dev-armhf-cross \
            libc6-dev-i386 libc6-i386 libcairo2:i386 libcap2:i386 \
            libcilkrts5-armhf-cross libdatrie1:i386 libelf-dev:i386 libelf1:i386 \
            libexpat1:i386 libffi6:i386 libfontconfig1:i386 libfreetype6:i386 \
            libgcc-5-dev-armhf-cross libgcc-7-dev-armhf-cross libgcc1:i386 \
            libgcc1-armhf-cross libglib2.0-0:i386 libgomp1-armhf-cross libgpm2:i386 \
            libgraphite2-3:i386 libharfbuzz0b:i386 libisl15 libmount1:i386 \
            libncurses5:i386 libncurses5-dev libnspr4:i386 libnss3:i386 \
            libpango-1.0-0:i386 libpango1.0-0 libpango1.0-0:i386 \
            libpangocairo-1.0-0:i386 libpangoft2-1.0-0:i386 libpangox-1.0-0 \
            libpangox-1.0-0:i386 libpangoxft-1.0-0:i386 libpci3:i386 libpcre3:i386 \
            libpcsclite1 libpixman-1-0:i386 libpng16-16:i386 librhash0 libselinux1:i386 \
            libsfasan2-armhf-cross libsfatomic1-armhf-cross libsfgcc-5-dev-armhf-cross \
            libsfgcc1-armhf-cross libsfgomp1-armhf-cross libsfstdc++-5-dev-armhf-cross \
            libsfstdc++6-armhf-cross libsfubsan0-armhf-cross libsodium23 \
            libsqlite3-0:i386 libssl-dev:i386 libssl1.1:i386 libstdc++-5-dev-armhf-cross \
            libstdc++-7-dev-armhf-cross libstdc++6-armhf-cross libtext-unidecode-perl \
            libthai0:i386 libtinfo-dev libtinfo-dev:i386 libtinfo5:i386 \
            libubsan0-armhf-cross libudev1:i386 libuuid1:i386 libuv1 \
            libwayland-egl1-mesa libx11-6:i386 libx11-xcb1:i386 libxau6:i386 \
            libxcb-render0:i386 libxcb-shm0:i386 libxcb1:i386 libxcomposite1:i386 \
            libxcursor1:i386 libxdamage1:i386 libxdmcp6:i386 libxext6:i386 \
            libxfixes3:i386 libxfont2 libxft2:i386 libxi6:i386 libxkbfile1 \
            libxrandr2:i386 libxrender1:i386 libxss1:i386 libxtst6:i386 \
            linux-libc-dev:i386 linux-libc-dev-armel-cross linux-libc-dev-armhf-cross \
            mingw-w64-common mingw-w64-i686-dev openjdk-11-jre-headless php-common \
            php7.2-cgi php7.2-cli php7.2-common php7.2-json php7.2-opcache \
            php7.2-readline psmisc ssl-cert tex-common texinfo uuid-runtime \
            x11-xkb-utils xfonts-base xfonts-encodings xfonts-utils xserver-common \
            xsltproc xutils-dev xvfb zlib1g:i386 zlib1g-dev:i386 \
            libblkid1 libmount1 libblkid1 libmount1
