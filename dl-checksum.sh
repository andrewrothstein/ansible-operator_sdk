#!/usr/bin/env sh
VER=v0.11.0
DIR=~/Downloads
MIRROR=https://github.com/operator-framework/operator-sdk/releases/download/${VER}

dl()
{
    local os=$1
    local arch=$2
    local file=operator-sdk-${VER}-${arch}-${os}
    local url=$MIRROR/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $os `sha256sum $lfile | awk '{print $1}'`
}

printf "  %s:\n" $VER
printf "    %s:\n" x86_64
dl linux-gnu x86_64
dl apple-darwin x86_64


