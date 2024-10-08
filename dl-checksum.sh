#!/usr/bin/env sh
set -e
DIR=~/Downloads
# https://github.com/operator-framework/operator-sdk/releases/download/v1.3.0/operator-sdk_linux_amd64
MIRROR=https://github.com/operator-framework/operator-sdk/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}_${arch}"
    local file=operator-sdk_${platform}
    local url=$MIRROR/$ver/$file
    local lfile=$DIR/$file-${ver}

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver linux ppc64le
    dl $ver linux s390x
}

dl_ver ${1:-v1.37.0}
