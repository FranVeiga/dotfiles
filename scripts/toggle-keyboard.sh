#! /usr/bin/sh

case $(setxkbmap -query | grep layout | awk '{print $2}') in
    latam) setxkbmap us;;
    us) setxkbmap latam;;
esac

