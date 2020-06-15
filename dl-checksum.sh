#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/operator-framework/operator-sdk/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local file=operator-sdk-${ver}-${arch}-${os}
    local url=$MIRROR/$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $os `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    printf "    %s:\n" x86_64
    dl $ver linux-gnu x86_64
    dl $ver apple-darwin x86_64
}

dl_ver ${1:-v0.18.1}
