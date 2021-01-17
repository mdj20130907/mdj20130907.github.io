# https://mirrors.tuna.tsinghua.edu.cn/help/lineageOS/
# https://wiki.lineageos.org/devices/lavender/build
# https://docs.docker.com/engine/reference/builder/
# https://github.com/search?q=lineageos+docker&type=
# https://developer.aliyun.com/mirror/ubuntu

FROM ubuntu:20.04
COPY sources.list /etc/apt/sources.list
ENV TZ=Asia/Shanghai
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
 && apt upgrade -y \
 && apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev \
 && apt autoremove \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

# ccache
ENV USE_CCACHE=1 CCACHE_EXEC=/usr/bin/ccache CCACHE_DIR=/ccache CCACHE_MAXSIZE=50G
