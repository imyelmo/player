#!/bin/bash
ip=$(date +'%y')
cmd="cvlc rtp://225.0.0.$ip:5004 --aout=dummy --vout=dummy"
eval "$cmd"
#su vlc -c "$cmd"
