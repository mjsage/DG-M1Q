#!/bin/sh

#ip address of time server
timeserver=192.168.1.1

#comment out to stop httpd from running.
httpd="/mnt/disc1/busybox httpd"

#remount sd card as executable
mount -t vfat -o rw,exec,umask=000,remount /dev/mmcblk0p1 /mnt/disc1
#
echo " remounting SD with exec"

#check if timeserver set and for busybox on sd card

if [ ! -z "$timeserver" ] && [ -e /mnt/disc1/busybox ]; then

# get time

/mnt/disc1/busybox ntpd -q -p $timeserver
fi


if [ -e /mnt/disc1/httpd.conf ]; then

  conf="-c /mnt/disc1/httpd.conf"
  else
  conf=""
  
fi

#launch http server

#/mnt/disc1/httpd -h /mnt/disc1/npc $conf </dev/null &>/dev/null &

if [ ! -z "$httpd"  ] && [ -e /mnt/disc1/busybox ]; then
$httpd -h /mnt/disc1/npc $conf </dev/null &>/dev/null &
fi

#


