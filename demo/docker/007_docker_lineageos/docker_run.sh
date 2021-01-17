docker run \
-it \
--rm \
-h lineageos-build \
-v /Volumes/SG-TM/aosp_build/lineageos:/lineageos \
-v `pwd`/ccache:/ccache \
lineageos-build-focal

# cd /lineageos/
# source build/envsetup.sh
# breakfast lavender
# croot
# brunch lavender
