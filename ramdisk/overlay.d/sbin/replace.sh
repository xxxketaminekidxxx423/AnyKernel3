#!/system/bin/sh

exec > /dev/kmsg 2>&1

# Replace file conflicted with bind

echo "#empty" > /dev/fstab.enableswap

chmod 644 /dev/fstab.enableswap

mount --bind /dev/fstab.enableswap /vendor/etc/fstab.enableswap
if [ $? -eq 0 ]; then
  echo "[Genom] Replaced fstab.enableswap with empty file"
else
  echo "[Genom] Failed replacing fstab.enableswap"
fi
