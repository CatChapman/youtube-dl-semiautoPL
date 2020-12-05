# youtube-dl-semiautoPL AKA fancy_ytplist.sh
script for OS X (and Linux too? untested, YMMV) that uses youtube-dl https://github.com/ytdl-org/youtube-dl to download a playlist as audio in its own folder (named after the playlist title), forcing highest quality, and automagically producing an update script to use within the playlist's folder so you can update the content at your leisure. handy if a playlist updates regularly and you want to save the content for offline listening. public domain music and/or lectures and stuff like that.

# to use

**you need youtube-dl** https://github.com/ytdl-org/youtube-dl

**you need youtube-dl** https://github.com/ytdl-org/youtube-dl

**you need youtube-dl** https://github.com/ytdl-org/youtube-dl

you also need bash

I've only tested this on OS X

YOU NEED TO DOWNLOAD BOTH fancy_ytplist.sh AND getpldir.sh!

# HOW to use

save the script in the directory you are happy with having subdirectories of playlists' content. e.g. "~/Youtube\ Playlists/"

make sure the script is executable (chmod +x fancy_ytplist.sh)

run as: ./fancy_ytplist.sh [playlist URL OR ID here]

you can use the full URL or the playlist ID, it doesn't matter.

IN THE FOLDER where all the audio gets downloaded, you will have an update.sh script produced automagically. it will also (hoepfully) automagically be executable. if you want to update (i.e. your playlist of choice gets new content), just run that script as-is (./update.sh) from within the playlist's folder, and it'll download any new content, skipping already-downloaded content. the playlist ID/URL is hard-coded into the script so it will ideally be good to go out-of-the-box.

e.g.

let's say you run this script within "~/Youtube\ Playlists/" for a playlist titled "This is a Playlist"

a folder titled "This\ is\ a\ Playlist/" will be created and populated with the contents of said playlist

an update.sh script will also populate that folder

if This is a Playlist updates, simply run update.sh within "This\ is\ a\ Playlist/" to updaye the content of your "This\ is\ a\ Playlist/" folder.

if you run update.sh outside of that folder, it will still download the playlist, but it will be redundant and download everything all over again. which, hey, you do you.

# disclaimers

I wrote this over the course of about a day and I can't claim any support for it. I'm more of a tinkerer than a coder.

please don't use this for illegal or nefarious purposes. that wouldn't be very Cash Money of you. please be Cash Money with this script. please only use this script to download content whose copyright you will not be infringing upon by downloading it for offline use.

# special thanks

shoutouts to G for helping with isolating the playlist name and subsequently the approrpiate directory name. you are Very Cash Money and this script would not work without your Cash Money ways.

# please be Cash Money with this script. be a good citizen and obey the law.
