#!/bin/bash

youtube-dl -f ‘bestaudio’ -i -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' ${1}

youtube-dl -s ${1} >> tempID.txt
#silent youtube-dl dump into a tempID.txt file, for use by getpldir.sh to extract the playlist name and subsequently the directory name

dir=$(./getpldir.sh)
#invoking the getpldir.sh script to get the playlist directory name

script="update.sh"
#using "update.sh" as a var seems to play nicer, idk if it's really necessary but...?

dir="$dir/"
#have to put the trailing / in the var itself otherwise it complains
#this notation is necessary for playlists containing more than one word

rm tempID.txt
#removing the temp file otherwise things get wonky.

echo "#!/bin/bash" >> "$dir""$script"

#creating the update.sh script in the desired directory
#have to put quotes around the variables when called otherwise it complains

echo "youtube-dl -f ‘bestaudio’ -i -o '%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/playlist?list=${1}" >> "$dir""$script"
#finalizing update.sh

chmod +x "$dir""$script"
#making update.sh executable
