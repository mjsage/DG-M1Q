#!/bin/sh

echo "Content-Type: text/html"
echo ""

echo "<html><body>"

cd /mnt/disc1/npc/

find * -type f -size +0 -exec echo "<a href=\"/{}\">{}</a><br>" \; 

echo "</body></html>"


