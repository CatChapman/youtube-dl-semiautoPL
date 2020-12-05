#!/bin/bash

youtube-dl -f ‘bestaudio’ -i -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' ${1}

youtube-dl -s ${1} >> tempID.txt

dir=$(./getpldir.sh)
#using "update.sh" as a var seems to play nicer, idk if it's really necessary but...?
script="update.sh"
#have to put the trailing / in the var itself otherwise it complains
dir="$dir/"


rm tempID.txt
#have to put quotes around the variables when called otherwise it complains
echo "#!/bin/bash" >> "$dir""$script"

echo "youtube-dl -f ‘bestaudio’ -i -o '%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/playlist?list=${1}" >> "$dir""$script"
chmod +x "$dir""$script"
