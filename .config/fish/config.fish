export ANDROID_HOME=/opt/android-sdk
export EDITOR=/usr/bin/vim
export TERMINAL=roxterm
alias sourcefish "source ~/.config/fish/config.fish"
alias hello "uname -a ; lsb_release -a; echo '(whoami) i am:  '(whoami) ; echo "
set -x PATH $PATH /usr/bin/core_perl
set -x TERM "screen-256color"
alias playterraria "steam steam://rungameid/105600"
alias fuckingbullshit "sudo systemctl stop netctl; sudo systemctl start netctl; sudo killall dhcpcd ; sudo ip link set wlp3s0 down"

set uvideo 'bestvideo[ext=webm][height<=?480]'
set uaudio 'bestaudio[ext=webm]'

#alias utubo "youtube-dl $1 -f 'bestvideo[ext=webm][height <=? 480]+bestaudio[ext=webm]'"
function utubo --inherit-variable uvideo --inherit-variable uaudio
    #youtube-dl $argv -f 'bestvideo[ext=webm][height <=? 480]+bestaudio[ext=webm]'
    youtube-dl $argv -f $uvideo+$uaudio
end

#alias umpv "mpv (youtube-dl $1 -g -f $uvideo) --audio-file (youtube-dl $1 -g -f $uaudio)"
function umpv --inherit-variable uvideo --inherit-variable uaudio
    mpv (youtube-dl $argv -g -f $uvideo) --audio-file (youtube-dl $argv -g -f $uaudio) --pause
end

### NETWORK FUNCTIONS
alias STFU="ip link set wlp3s0 down"
#
function ippubblico
    echo -n "(attendere...connessione in corso...) ==============>  "
    #echo "il tuo ip pubblico e' $(curl -s checkip.dyndns.org | sed 's#.*Address: \(.*\)</b.*#\1#')"
    echo "il tuo ip pubblico e' "(wget http://ipinfo.io/ip -qO -)
end

function iprouter
    echo "l'ip del tuo router e' "(route -n | awk 'FNR==3 {print $2}')
end

function ipmio
    echo "il tuo ip privato e' "(ifconfig wlp3s0 | awk '/inet / { print $2 }')
    #echo $_
end

function lamiarete
    echo "1) " (ipmio)
    echo "2) "(iprouter)
    echo -n "3) "; echo (ippubblico)
end

function upgrade-pip
    set pipdir "/home/mad/bin/upgrade-pip.py"
    sudo python $pipdir
end





######### STARTING!
screenfetch -A 'lollllll';
######### AUTOSTART X IF tty1 && DO NOT QUIT IF X CRASHES!
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
            startx -- -keeptty
    end
end
