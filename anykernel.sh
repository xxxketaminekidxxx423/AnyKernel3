# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=NetErnels Kernel
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=mojito
device.name2=RedmiNote10
device.name3=sunny
device.name4=Mojito
device.name5=Sunny
supported.versions=11-12
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

ui_print "Patching system's build prop for fuse passthrough..." 
# FUSE Passthrough
patch_prop /system/build.prop "persist.sys.fuse.passthrough.enable" "true" 

## AnyKernel boot install
dump_boot;

write_boot;
## end boot install
