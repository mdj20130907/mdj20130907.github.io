# path/to/aosp
AOSP=$1

if [ -z $AOSP ]; then
    echo "请输入aosp路径"
    exit
fi

if [ ! -d $AOSP"/out/.ccache" ]; then
  mkdir -p $AOSP"/out/.ccache"
fi

if [ ! -f $AOSP"/out/.ccache/bashrc" ]; then
  cat >$AOSP"/out/.ccache/bashrc" <<EOF
export CCACHE_DIR=/aosp/out/.ccache
ccache -M 50G #在该DIR执行一次后就保存住了
ccache -s # 查看状态
export USE_CCACHE=1
export CCACHE_EXEC=\$(command -v ccache)
EOF
fi

docker run \
-it \
--rm \
-h android-build \
-v $AOSP:/aosp \
android-build-trusty

# source /aosp/out/.ccache # 使用ccache

# cd /aosp; source build/envsetup.sh
# lunch aosp_arm-eng
# m

# find . -type l -print | xargs ls -alh | grep "/media/"
# ./host/linux-x86/bin/insertkeys.py -> $AOSP/system/sepolicy/tools/insertkeys.py
# ./host/linux-x86/obj/EXECUTABLES/insertkeys.py_intermediates/insertkeys.py -> $AOSP/system/sepolicy/tools/insertkeys.py
# ./soong/.intermediates/prebuilts/build-tools/m4/linux_glibc_x86_64/m4 -> $AOSP/prebuilts/build-tools/linux-x86/bin/m4
# ./soong/.intermediates/system/sepolicy/tools/insertkeys.py/linux_glibc_x86_64/insertkeys.py -> $AOSP/system/sepolicy/tools/insertkeys.py
# ./soong/host/linux-x86/bin/insertkeys.py -> $AOSP/system/sepolicy/tools/insertkeys.py
