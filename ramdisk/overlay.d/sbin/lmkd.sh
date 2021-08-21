#!/system/bin/sh

exec > /dev/kmsg 2>&1

# prop tweak
resetprop ro.lmk.kill_timeout_ms 100
resetprop ro.lmk.psi_complete_stall_ms 150
resetprop ro.lmk.swap_free_low_percentage 20
resetprop ro.lmk.downgrade_pressure 60
killall lmkd
if [ $? -eq 0 ]; then
  echo "[Genom] Prop lmkd done"
else
  echo "[Genom] Prop lmkd failed"
fi
