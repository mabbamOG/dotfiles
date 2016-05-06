# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true
echo 'HELLO! :)'
alias lokmi='~/bin/lock/lock'
export TERMINAL=roxterm
export ANDROID_HOME=/opt/android-sdk
alias sourcebash="source ~/.bashrc" 
PATH=$PATH:/usr/bin/core_perl
export TERM="screen-256color"
alias fuckingbullshit="sudo systemctl stop netctl; sudo systemctl start netctl;sudo killall dhcpcd;sudo ip link set wlp3s0 down"

QUALITA_YOUTUBE=720
uvideo="bestvideo[ext=webm][height<=?$QUALITA_YOUTUBE]"
uaudio="bestaudio[ext=webm]"
function utubo {
    if [[ "$2" =~ "^[0-9]+$" ]]; #if $2 a number
        then
            uvideo="bestvideo[ext=webm][height<=?$2]"
    fi
    if [ "$2" == "novideo" ]; then # if video not wanted
        youtube-dl $1 -g -f $uaudio
    elif [ "$2" == "noaudio" ] || [ "$3" == "noaudio" ]; then # if audio not wanted
        youtube-dl $1 -g -f $uvideo
    else # normal
        youtube-dl $1 -g -f $uvideo+uaudio
    fi
    
    youtube-dl $1 -f $uvideo+$uaudio # normal
}
function umpv {
    if [[ "$2" =~ "^[0-9]+$" ]]; #if $2 a number
        then
            uvideo="bestvideo[ext=webm][height<=?$2]"
    fi
    if [ "$2" == "novideo" ]; then # if video not wanted
        mpv $(youtube-dl $1 -g -f $uaudio)
    elif [ "$2" == "noaudio" ] || [ "$3" == "noaudio" ]; then # if audio not wanted
        mpv --pause $(youtube-dl $1 -g -f $uvideo)
    else # normal
        mpv --pause $(youtube-dl $1 -g -f $uvideo) --audio-file $(youtube-dl $1 -g -f $uaudio)
    fi
}

function ippubblico {
echo -n "(attendere...connessione in corso...) ==============>  "
    #echo "il tuo ip pubblico e' $(curl -s checkip.dyndns.org | sed 's#.*Address: \(.*\)</b.*#\1#')"
    echo "il tuo ip pubblico e' $(wget http://ipinfo.io/ip -qO -)"
}

function iprouter {
echo "l'ip del tuo router e' $(route -n | awk 'FNR==3 {print $2}')"
}

function ipmio {
echo "il tuo ip privato e' $(ifconfig wlp3s0 | awk '/inet / { print $2 }')"
}

function lamiarete {
echo "1) $(ipmio)"
echo "2) $(iprouter)"
echo -n "3) "; echo "$(ippubblico)"
}
function upgrade-pip {
pipdir="/home/mad/bin/upgrade-pip.py"
sudo python $pipdir
}

alias STFU="ip link set wlp3s0 down"
alias hello="uname -a && lsb_realease -a"
screenfetch
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
