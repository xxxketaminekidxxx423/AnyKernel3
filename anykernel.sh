# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers
# Modified By Knight

## AnyKernel setup
# begin properties
properties() { '
kernel.string=NetErnels Kernel
do.devicecheck=1
do.modules=0
do.systemless=0 
do.cleanup=1
do.cleanuponabort=0
device.name1=RMX2020
device.name2=rmx2020
device.name3=rmx2027
device.name4=ZIPKUS
device.name5=RMX2193
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/platform/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel boot install
dump_boot;

write_boot;
## end install
