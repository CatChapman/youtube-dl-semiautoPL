# 2024-10-21 update: youtube-dl is dead, long live youtube-dl. I have modified this script to support yt-dlp and it lives in a new repo here. https://github.com/CatChapman/ytplist

# youtube-dl-semiautoPL AKA fancier_ytplist.sh

### as of 2020-12-18, youtube-dl version 2020-12-14 seems to work with this script once again. huzzah!

# ***NEW! IMPROVED!*** fancier_ytplist.sh is even fancier! input handling! checks for bad URLs! better update.sh handling (checks for existing update.sh in target directory and prompts user on how to proceed)! also includes automagic m3u playlist generation! fancy living!

# getpldir.sh is no longer needed! wow! so much fancy!

script for OS X (and Linux too? untested, YMMV) that uses youtube-dl https://github.com/ytdl-org/youtube-dl to download a playlist as audio in its own folder (named after the playlist title), forcing highest quality, and automagically producing an update script to use within the playlist's folder so you can update the content at your leisure. it'll also make an m3u playlist file so you can plop it into your media player of choice and enjoy - update script creates updated playlists too. handy if a playlist updates regularly and you want to save the content for offline listening. public domain music and/or lectures and stuff like that.

I have added a feature that, if you have ffmpeg installed, will provide the option to convert all downloaded .webm files to .mp3 files, as I had some complaints about the .webm format. (VLC plays .webm fine, for your information! but - adding this functionality was easy enough. I might expand it as right now it exists in a vacuum; this functionality is *not* reflected in update.sh, and is only present in the main script execution)

# to use
**you need youtube-dl** https://github.com/ytdl-org/youtube-dl/

**you need youtube-dl** https://github.com/ytdl-org/youtube-dl/

**you need youtube-dl** https://github.com/ytdl-org/youtube-dl/

you also need bash

I've only tested this on OS X


# HOW to use fancier_ytplist.sh (***NEW! IMPROVED! SHINY! FANCIER!***)

you run this from your terminal application. on OS X it's typically Terminal.app.

save the scripts in the directory you are happy with having subdirectories of playlists' content. e.g. "~/Youtube\ Playlists/"

make sure the script is executable (chmod +x fancier_ytplist.sh)

run as: ./fancier_ytplist.sh [optional playlist URL OR ID here; it will prompt you otherwise]

you can use the full URL or the playlist ID, it doesn't matter.

IN THE FOLDER where all the audio gets downloaded, you will have an update.sh script produced automagically. if an update.sh already exists in that folder, you will be prompted as to whether or not you want to overwrite it with a new update.sh (e.g. if you are going from fancy_ytplist.sh to fancier_ytplust.sh, you may want to overwrite the original update.sh!). ideally to update your playlists you'd use the update.sh within the playlist folder, but I wanted to have this presence-checking functionality because it was tedious to continuously remove update.sh during testing as to avoid redundancy in the file itself.

***¡FANCY TIME!*** you will ALSO have an m3u playlist file generated using the contents of the playlist folder, so you can pop it into your player of choice, and enjoy your content right away! it will be timestamped with YYYY-MM-DD-minutes followed by the name of your playlist folder, e.g. 2020-12-13-34_YourPlaylistHere.m3u. It will be generated in your playlist folder.

the update.sh script will also (hoepfully) automagically be executable. if you want to update (i.e. your playlist of choice gets new content), just run that script as-is (./update.sh) from within the playlist's folder, and it'll download any new content, skipping already-downloaded content. the playlist ID/URL is hard-coded into the script so it will ideally be good to go out-of-the-box. ***¡FANCY TIME!*** the NEW and IMPROVED update.sh script will ALSO update the playlist, timestamped by the day and minute. it will append info the the same file if you update it more than once in a minute; I want to fix this later with prompting or something, but timestamping by the minute seems to be a decent enough fix.

e.g.

let's say you run this script within "~/Youtube\ Playlists/" for a playlist titled "This is a Playlist"

a folder titled "This\ is\ a\ Playlist/" will be created within "~/Youtube\ Playlists/" and populated with the contents of said playlist, indexed by position in the playlist. so #1 on the list would be 01 - [insert title here], #1 would be 02 - [insert title here] and so on. the file format depends on the video and its container, but it's usually webm and sometimes mp4. VLC is always able to play whatever this downloads.

an update.sh script will also populate that folder

a $timestamp_$playlistname.m3u playlist file will also populate that folder

if This is a Playlist updates, simply run update.sh within "This\ is\ a\ Playlist/" to update the content of your "This\ is\ a\ Playlist/" folder. a new playlist will also be generated, with the current date's timestamp. if you know the date command within bash, it's easy enough to change the specificity of the timestamp within the script, or remove it altogether, customize it, whatever.

if you run update.sh outside of that folder, it will still download the playlist, but it will be redundant and download everything all over again. which, hey, you do you.

# disclaimers

I did not go to Computer College. I'm more of a tinkerer than a coder. That said, this works for me on youtube-dl version 2020-12-14. 

pretty please don't use this for illegal or nefarious purposes. that wouldn't be very Cash Money of you. please be Cash Money with this script. please only use this script to download content whose copyright you will not be infringing upon by downloading it for offline use.

# why?

because I'm really lazy and I wanted this *specific* functionality

# todo

validate youtube URLs. I have the regex pattern from the youtube-dl python code but it doesn't seem to play nicely with bash. or I'm just doing it wrong - very possible.

# what's this testing foler?! que?!

experimental stuff that is too messy (even for my standards) to commit to the main script goes into the test script that lives in the testing folder. use at even more of your own risk than the regular script.

currently there's playlist generation for the files converted into mp3. because, idk, seemed easy enough to do.

# special thanks

shoutouts to G for helping with isolating the playlist name and subsequently the approrpiate directory name for the update.sh script. you are Very Cash Money and this script would not work without your Cash Money ways.

# please be Cash Money with this script. be a good citizen and obey the law.
