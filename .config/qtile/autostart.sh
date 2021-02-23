#! /bin/sh

rfkill unblock bluetooth &  # CAREFUL user has to be in the rfkill group.

picom &
nitrogen --restore &
lxpolkit &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
nm-applet &
blueman-applet &
pamac-tray &
protonvpn-tray &
redshift-gtk &    	 




