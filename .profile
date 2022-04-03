if [[ ! $(tty) =~ /dev/tty. ]]; then
	date="$(date +%d\ %m)"

	while true; do
		temp=$(sensors | sed -n /Package\ id\ 0:/p | sed -n 's/\..°C.*/°/p' | sed -n 's/^.*+//p')
		hour="$(date +%H:%M)"
		battery="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | cut -d ":" -f 2 | tr -d ' ')"
		string=" ${temp} ${battery} ${date} ${hour}"
		xsetroot -name "$(echo "${string}")"
		sleep 15
	done &
	xrandr --output VGA1 --right-of LVDS1 --mode 1024x768 --rate 60.00
	xrandr --output DP2 --right-of LVDS1 --auto
	xwallpaper --zoom $HOME/usr/slike/wallpaper/pticja_hiska.jpg
fi

export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export LYNX_CFG=$HOME/doc/zapiski/cfg/lynx.cfg
export PASSWORD_STORE_DIR=$HOME/doc/zapiski/cfg/.password-store/
PLAN9=/usr/local/plan9port export PLAN9
PATH=$PATH:$PLAN9/bin export PATH

