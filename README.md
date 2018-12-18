# DG-M1Q
A quick hack to provide (insecure) access to the sd card using a http server.

Remounts the sd card with execute permission, and runs a httpd server on port 80 with sdcard:/npc/ as home directory and creates a list of links to download the recordings and images, currently this doesn't filter out directory names and empty files.

Unzip DG-M1Q.zip to root of SD card.
telnet the camera, username root, no password.

sh /mnt/disc1/httpd.sh


A windows batch file is provided to open this camera's .av files in VLC


Video settings for the app streams can apparently be found in /npc/congig/video_sc1135.xml and /npc/congig/image_sc1135.xml. I couldn't see any difference on the small low-res screen of my mobile phone. Be careful editing, the wrong values may crash the camera - I'd try to telnet in and killall npc if that happens, unfortunately these do not appear to have any effect on the bitrate of the very poor quality ONVIF / RTSP stream.


```

/npc/congig/video_sc1135.xml


~ ~ ~

<Stream0>
                                <id>0</id>
                                <type>1</type>
                                <width>1280</width>
                                <height>960</height>
                                <fps>15</fps>
                                <rotate>0</rotate>
                                <keep_aspect>1</keep_aspect>
                                <h264_id>0</h264_id>
                                <h264_gop_mode>0</h264_gop_mode>
                                <h264_gop_M>1</h264_gop_M>
                                <h264_gop_N>50</h264_gop_N>
                                <h264_idr_interval>1</h264_idr_interval>
                                <h264_profile>0</h264_profile>
                                <h264_bcr>1</h264_bcr>             <= Presumably 0,1 selects between constant and variable bit rate
                                <h264_cbr_avg_bps>1000000</h264_cbr_avg_bps>
                                <h264_vbr_min_bps>1000000</h264_vbr_min_bps>
                                <h264_vbr_max_bps>2000000</h264_vbr_max_bps>
                                <h264_quality>3</h264_quality>      <= 1 will probably be best quality
                                <h264_puality_con>1</h264_puality_con>
                                <h264_qp_min_I>14</h264_qp_min_I>
                                <h264_qp_min_P>17</h264_qp_min_P>
                                <h264_qp_reduce_I>3</h264_qp_reduce_I>
                                <h264_qp_reduce_P>5</h264_qp_reduce_P>
                                <mjpeg_id>0</mjpeg_id>
                                <mjpeg_quality>50</mjpeg_quality>
                                <mjpeg_chromaformat>1</mjpeg_chromaformat>
                        </Stream0>
 
 ~ ~ ~
 
 ```


Instead of using the audio tones of the app, the Wifi password for this camera can be configured using a text file, wifiInfo.txt in the root of the sd card: https://www.mydigoo.com/Digoo-DG-M1Q-Can`t-Connect-Problem-Fixed-p-42.html . I think the camera should also boot with an open wifi AP before it is set up. 
