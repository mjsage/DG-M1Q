# DG-M1Q
A quick hack to provide (insecure) access to the sd card using a http server.

Remounts the sd card with execute permission, and runs a httpd server on port 80 with sdcard:/npc/ as home directory and creates a list of links to download the captures and images

Unzip DG-M1Q.zip to root of SD card.
telnet the camera, username root, no password.

sh /mnt/disc1/httpd.sh


A windows batch file is provided to open this camera's .av files in VLC
