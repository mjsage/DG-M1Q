rem vlc.exe.lnk "%CD%\%1" --demux=h264

rem "%ProgramFiles(x86)%\VideoLAN\VLC\vlc.exe" "%1" --demux=h264

rem check for 64 bit vlc

if exist "%ProgramFiles%\VideoLAN\VLC\vlc.exe" (

"%ProgramFiles%\VideoLAN\VLC\vlc.exe" %1% --demux=h264

) else (
		"%ProgramFiles(x86)%\VideoLAN\VLC\vlc.exe" %1% --demux=h264
)
