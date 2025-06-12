echo 'Starting to clone stuffs needed to build for Haydn'

# Common Tree
git clone --depth=1 https://github.com/JARVIS-4356/device_xiaomi_sm8350-common.git -b 15 device/xiaomi/sm8350-common

# Haydn Vendor
git clone --depth=1 https://github.com/JARVIS-4356/vendor_xiaomi_haydn.git -b 15 vendor/xiaomi/haydn

# Common Vendor
git clone --depth=1 https://github.com/JARVIS-4356/vendor_xiaomi_sm8350-common.git -b 15 vendor/xiaomi/sm8350-common

# Kernel
echo 'Cloning kernel tree'
git clone --depth=1  https://github.com/JARVIS-4356/kernel_xiaomi_sm8350.git --recursive -b 15 kernel/xiaomi/sm8350

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b fourteen vendor/xiaomi/haydn-firmware

# Xiaomi
echo 'Cloning hardware xiaomi'
rm -rf hardware/xiaomi && git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi -b lineage-22.2 hardware/xiaomi

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera -b fourteen-leica vendor/xiaomi/haydn-miuicamera
rm -rf hardware/xiaomi/megvii

# Leica Patch
cd frameworks/native
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/refs/heads/14/Leicamera/0001-Add-back-redundant-connect-methods-in-Surface.patch
patch -p1 <0001-Add-back-redundant-connect-methods-in-Surface.patch
cd ../..

echo 'delete vendorsetup.sh from device tree once this is done'
