#!/usr/bin/env sh
VER=v0.9.0
DIR=~/Downloads
MIRROR=https://github.com/operator-framework/operator-sdk/releases/download/${VER}

dl()
{
    OS=$1
    ARCH=$2
    FILE=operator-sdk-${VER}-${ARCH}-${OS}
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "      # %s\n" $URL
    printf "      %s: sha256:%s\n" $OS `sha256sum $LFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
printf "    %s:\n" x86_64
dl linux-gnu x86_64
dl apple-darwin x86_64


