# 浏览器下载jdk8,放在该目录: jdk8-master.tar.gz
# https://android.googlesource.com/platform/prebuilts/jdk/jdk8/+archive/master.tar.gz

docker build \
--build-arg userid=$(id -u) \
--build-arg groupid=$(id -g) \
--build-arg username=$(id -un) \
-t android-build-trusty .
