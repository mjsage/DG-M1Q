#start npc boot

cp /npc/sensors/* /etc/sensors/ -Rf

if [ -e /patch/lib/mt7601Usta_v2.ko ] ; then
insmod /patch/lib/mt7601Usta_v2.ko
fi

sync;sync;sync && echo 3 > /proc/sys/vm/drop_caches

(sleep 20 && if [ -e /mnt/disc1/boot2.sh ]; then sh /mnt/disc1/boot2.sh; fi) </dev/null &>/dev/null &

