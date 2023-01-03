# Modify options in script, cd into directory where source files are located and run this script

# Constant Bit Rate
# -b:v 2000k => set bitrate
# $bitrate = "2000k"
# $bitrate = "4000k"
# $bitrate = "7000k"
$bitrate = "10000k"


# Constant Rate Factor 
# -crf 20 => set bitrate
# The range of the CRF scale is 0–51, where 0 is lossless (for 8 bit only, for 10 bit use -qp 0), 23 is the default, and 51 is worst quality possible.
# $constant_rate_factor = "10"
# $constant_rate_factor = "15"
$constant_rate_factor = "20"
# $constant_rate_factor = "23"
# $constant_rate_factor = "30"


# Video codec
# $video_codec = "copy"
# $video_codec = "h264_nvenc"
$video_codec = "hevc_nvenc"

# Audio codec
$audio_codec = "copy"
# $audio_codec = "aac"


New-Item -ItemType Directory -Path .\converted
$videos = Get-ChildItem -File

# -hwaccel cuda => use GPU hardware acceleration
# use bitrate or crf
# foreach ($video in $videos){ ffmpeg -i ".\$video" -c:a $audio_codec -c:v $video_codec -b:v $bitrate ".\converted\$video" }
foreach ($video in $videos){ ffmpeg -hwaccel cuda -i ".\$video" -c:a $audio_codec -c:v $video_codec -b:v $bitrate ".\converted\$video" }
# foreach ($video in $videos){ ffmpeg -hwaccel cuda -i ".\$video" -c:a $audio_codec -c:v $video_codec -crf $constant_rate_factor ".\converted\$video" }