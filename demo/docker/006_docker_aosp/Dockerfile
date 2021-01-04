# https://android.googlesource.com/platform/build/+/master/tools/docker

# https://registry.hub.docker.com/_/ubuntu
# 14.04, trusty
FROM ubuntu:14.04
ARG userid
ARG groupid
ARG username

# https://developer.aliyun.com/mirror/ubuntu
COPY sources.list /etc/apt/sources.list

# https://source.android.google.cn/setup/build/initializing
RUN apt-get update \
 && apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN groupadd -g $groupid $username \
 && useradd -m -u $userid -g $groupid $username \
 && echo $username >/root/username \
 && echo "export USER="$username >>/home/$username/.bashrc

ENV HOME=/home/$username
ENV USER=$username
ENTRYPOINT chroot --userspec=$(cat /root/username):$(cat /root/username) / /bin/bash -i