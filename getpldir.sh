#!/bin/bash

pldir=$(cat tempID.txt | grep "\[download\] Downloading playlist")
#extracts a relevant line from tempID.txt

pldir="${pldir/\[download\]\ Downloading\ playlist\:\ /}"
#this removes all the unnecessary stuff to extract the playlist title so fancy_ytplist.sh knows where to dump the update.sh script

echo $pldir
