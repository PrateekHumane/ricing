#!/bin/sh

# A rofi wrapper script for system functions.

# For non-systemd init systems.
case "$(readlink -f /sbin/init)" in
	*runit*) hib="sudo -A zzz" ;;
	*openrc*) reb="sudo -A openrc-shutdown -r"; shut="sudo -A openrc-shutdown -p 0" ;;
esac

cmds="\
🔒 lock		i3-msg exit
♻ restart i3	i3-msg restart
🔃 reboot	${reb:-sudo -A reboot}
🖥 shutdown	${shut:-sudo -A shutdown -h now}

choice="$(echo "$cmds" | cut -d'	' -f 1 | rofi -dmenu -i Sysact)" || exit 1

eval "$(echo "$cmds" | grep "^$choice	" | cut -d '	' -f2-)"
