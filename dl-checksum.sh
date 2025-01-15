#!/usr/bin/env sh
set -e
DIR=~/Downloads
# https://github.com/operator-framework/operator-sdk/releases/download/v1.3.0/operator-sdk_linux_amd64
MIRROR=https://github.com/operator-framework/operator-sdk/releases/download

dl()
{
    local lchecksums=$1
    local ver=$2
    local os=$3
    local arch=$4
    local platform="${os}_${arch}"
    local file=operator-sdk_${platform}
    local url=$MIRROR/$ver/$file
    local lfile=$DIR/$file-${ver}

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    local rchecksums="${MIRROR}/${ver}/checksums.txt"
    local lchecksums="${DIR}/operatorsdk_${ver}_checksums.txt"
    if [ ! -e "${lchecksums}" ];
    then
        curl -sSLf -o "${lchecksums}" "${rchecksums}"
    fi

    printf "  # %s\n" $rchecksums
    printf "  %s:\n" $ver
    dl $lchecksums $ver darwin amd64
    dl $lchecksums $ver darwin arm64
    dl $lchecksums $ver linux amd64
    dl $lchecksums $ver linux arm64
    dl $lchecksums $ver linux ppc64le
    dl $lchecksums $ver linux s390x
}

dl_ver ${1:-v1.39.1}
