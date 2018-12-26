#!/bin/sh

#ip address of time server
timeserver=192.168.1.1
home="/mnt/disc1/npc"


busybox="/mnt/disc1/busybox"
httpd="$busybox httpd"
ntpd="$busybox ntpd"

#remount sd card as executable

mount -t vfat -o rw,exec,umask=000,remount /dev/mmcblk0p1 /mnt/disc1
#

####mount vfat.img as /mnt/SD 
####mount -t vfat -o rw,exec,umask=000 /mnt/disc1/m1q.vfat.img /mnt/SD

if [ -e $busybox ]; then 

	# get time
	if [ ! -z "$timeserver" ]; then
		$ntpd -q -p $timeserver
	fi

#check for httpd config file

	if [ -e /mnt/disc1/httpd.conf ]; then

		conf="-c /mnt/disc1/httpd.conf"
	else
		conf=""
	fi

#launch http server home= /mnt/disc1/npc

#/mnt/disc1/httpd -h /mnt/disc1/npc $conf </dev/null &>/dev/null &

	if [ ! -z "$httpd"  ] && [ ! -z "$home" ]; then
		$httpd -h $home $conf -r M1Q </dev/null &>/dev/null &
	fi
	
#-e $busybox 
fi
