FILE=~/.xsession.fifo

rm "$FILE"
touch "$FILE"
#mkfifo "$FILE"
# xterm -e bash -c 'cat $0' "$FILE" &

exec > "$FILE"
exec 2> "$FILE"

set -x

LANG=en_US.UTF-8; export LANG
#XMODIFIERS="@im=SCIM"; export XMODIFIERS
#GTK_IM_MODULE="scim-bridge";  export GTK_IM_MODULE

xsetroot -solid black

X_GEOMETRY=`xwininfo -root -stats | grep -- '-geometry' | awk -F ' ' '{ printf "%s", $2 }'`
GEOMETRY=`echo "$X_GEOMETRY" | awk -F 'x+' '{ printf("%dx%d+%d+%d", $1 - 10, $2 - 40, $3 + 5, $4 + 5) }'`
sudo root-tail --noflicker --geometry "$GEOMETRY" --font fixed /var/log/syslog,green ~/.xsession.fifo,red --fork

xmodmap ~/.hachi/xmodmap
xrdb -merge < ~/.hachi/Xresources

xset s noblank
xset s noexpose
xset s off
xset -dpms

urxvtd -q -f -o

killall ssh-agent
eval `ssh-agent`
ssh-add ~/.ssh/keys/*
fbpanel &
gkrellm &
#synergys
xscreensaver -no-splash &
exec openbox

# vim: filetype=sh
