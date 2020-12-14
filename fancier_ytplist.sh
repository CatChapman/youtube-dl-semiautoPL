!/bin/bash

youtube-dl -f ‘bestaudio’ -i -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' ${1}

youtube-dl -s ${1} >> tempID.txt

dir=$(./getpldir.sh)
#using "update.sh" as a var seems to play nicer, idk if it's really necessary but...?
script="update.sh"
#have to put the trailing / in the var itself otherwise it complains
plname=$dir #duplicating this var before I add the slash so I can use it to name the m3u file
dir="$dir/"


rm tempID.txt
#have to put quotes around the variables when called otherwise it complains

#staging for m3u playlist generation
now=$(date "+%Y-%m-%d") #timestamps are cool and good
cd "$dir" #changing to newly created directory because it's simpler this way

ls | grep -v .sh | grep -v .m3u >> $now"_"$plname.m3u #ls piped thru inverse grep works better than plain ls I guess? macOS ships with BSD ls, not GNU ls; no inverse filter with BSD ls.

#test for the presence of update.sh in the target (now working) directory
#otherwise if update.sh exists, echo will append redundant lines into the file. not desired behavior.

if test -f "$script"; then
  echo "$script already exists in the target directory."
  echo "Do you wish to create a new $script script?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) rm $script;
      echo "#!/bin/bash" >> "$script";
      echo "youtube-dl -f ‘bestaudio’ -i -o '%(playlist_index)s - %(title)s.%(ext)s' ${1}" >> "$script";
      echo "now=\$(date \"+%Y-%m-%d\")" >> "$script";
      echo "ls | grep -v .sh | grep -v .m3u >> \$now\"_\"$plname.m3u" >> "$script";
      #so now the update script will also build a new playlist with each run
      chmod +x "$script";
      echo "$script has been written in $(pwd). Run $script within $(pwd) to update the files.";
      break;;
      No )
      echo "Okay, we are leaving $script alone for this run.";
      exit;;
    esac
  done

else #behavior for when there is no update.sh present in the target (again, now working) directory
  echo "#!/bin/bash" >> "$script"

  echo "youtube-dl -f ‘bestaudio’ -i -o '%(playlist_index)s - %(title)s.%(ext)s' ${1}" >> "$script"
  echo "now=\$(date \"+%Y-%m-%d\")" >> "$script"
  echo "ls | grep -v .sh | grep -v .m3u >> \$now\"_\"$plname.m3u" >> "$script"
  #so now the update script will also build a new playlist with each run
  chmod +x "$script"
  echo "$script has been written in $(pwd). Run $script within $(pwd) to update the files."
fi

#this is probably pretty sloppy, but I didn't go to computer college. sorry :)

#shoutouts:
# https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
# https://linuxize.com/post/bash-check-if-file-exists/
# https://www.shell-tips.com/bash/if-statement/
