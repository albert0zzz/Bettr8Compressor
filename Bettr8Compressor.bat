@echo off
setlocal enabledelayedexpansion
title Bettr8Compressor

REM Check if ffmpeg is installed on the system
where ffmpeg >nul 2>nul
if %errorlevel% neq 0 (
    echo ffmpeg is not found. Make sure it is installed and added to the PATH.
    exit /b
)

REM Receive parameters from the user
set /p input_file=Copy video location or drag your video here: 
set /p target_size=Enter the maximum file size in megabytes: 

REM Get video duration (in seconds) and audio bitrate (in bps)
for /f %%i in ('ffprobe -v error -show_entries format^=duration -of default^=noprint_wrappers^=1:nokey^=1 %input_file% 2^>^&1') do (
    set duration=%%i
)

for /f %%i in ('ffprobe -v error -select_streams a:0 -show_entries stream^=bit_rate -of default^=noprint_wrappers^=1:nokey^=1 %input_file% 2^>^&1') do (
    set audio_bitrate=%%i
)

REM Calculate the desired video bitrate for a given file size
set /a target_video_bitrate=(%target_size%*5500)/%duration%

REM Performing the first compression pass
ffmpeg -y -loglevel info -i "%input_file%" -c:v libx264 -filter:v scale=-1:720 -b:v %target_video_bitrate%k -pass 1 -f mp4 -an NUL

REM Performing the second compression pass
ffmpeg -y -loglevel info -i "%input_file%" -c:v libx264 -filter:v scale=-1:720 -b:v %target_video_bitrate%k -pass 2 -c:a aac -b:a %audio_bitrate% "%input_file:~0,-4%_compressed.mp4"

REM Delete temp files
del ffmpeg2pass-0.log ffmpeg2pass-0.log.mbtree
echo.
echo The video has been successfully compressed^!
echo.
pause
