#!/bin/sh
list() {
	local int=$1
	sudo iw dev $int scan|awk -f wifi.awk
}
if [ ! -r /etc/wifish/interface ];then
	echo "Interface to manage must be in /etc/wifish/interface" >2
	exit 127
fi
DEV=$(cat /etc/wifish/interface)
COMMAND=$1

case $COMMAND in
	list) list $DEV
	      ;;
	connect) shift
		 connect $DEV "$@"
		 ;;
        *) list $DEV
	   ;;
esac
