# path/to/aosp
AOSP=$1

if [ -z "$AOSP" ]; then
    echo "请输入aosp路径"
    exit
fi

docker run \
-it \
--rm \
-v $AOSP:/aosp \
android-build-trusty

# > cd /aosp; source build/envsetup.sh
# > lunch aosp_arm-eng
# > m -j50