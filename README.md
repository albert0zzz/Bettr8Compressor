# Bettr8Compressor
##  A nice video compressor written in Batch and ffmpeg
This script was made as an alternative to another compressor I was using, but was abandoned by its developer. The whole point of the utility is to compress the video to the size that the user specifies.

The project is written in Batch and I used ffmpeg as the video manipulation tool.

Here's what this utility offers:
* Video compression to user-specified sizes
* Adding "_compressed" postfix for compressed video
* Drag and Drop support

## How to use it?
Here are the simplest instructions for working with this utility.

1. Clone or download this project
2. Install ffmpeg: https://www.gyan.dev/ffmpeg/builds/
3. Put ffmpeg in $PATH
4. Run "Bettr8Compressor.bat"
5. Copy video location or drag your video into a terminal window
6. Specify the size of the compressed video in megabytes
7. ???
8. Profit!!!

## Find a bug?
If you found an issue or would like to submit an improvement to this project, please submit an issue using the issues tab above. If you would like to submit a PR with a fix, reference the issue you created!

## Known issues
1. The utility accepts **only integer** file size values. 

Example:

`Enter the maximum file size in megabytes: 25` - the utility will work ✅

`Enter the maximum file size in megabytes: 24.8` - the utility will not work ❌

2. All videos are compressed to **720p**, even if the video resolution is lower.

3. The utility only handles the **.mp4** format

4. All videos are saved in the Bettr8Compressor directory.

5. If you interrupt the program **during compression**, temporary files may remain. You will need to delete them **manually**.

6. **Large** files may be compressed to a size slightly larger than specified. I recommend that you specify a **smaller** video file size or compress the finished file again.

7. If you specify **small** video size, you may get an error about insufficient bitrate. I recommend **increasing** the size of the compressed file and compressing the finished result **again** if necessary.

## Did this project help you?
If you want to thank the developer for his work, give this project a star! ⭐
