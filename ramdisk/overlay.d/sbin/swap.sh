#!/system/bin/sh

# swapfile
file=/data/swapfile
if ! [ -f "$file" ]; then
  dd if=/dev/zero of=$file bs=100M count=15
  mkswap $file
  echo "[Genom] swapfile created" > /proc/bootprof
else
  echo "[Genom] swapfile already present" > /proc/bootprof
fi
swapon -p 0 $file
if [ $? -eq 0 ]; then
  echo "[Genom] swapfile enabled" > /proc/bootprof
else
  echo "[Genom] cannot enable swapfile" > /proc/bootprof
fi
