#! /bin/sh

case $1 in
    1) xbacklight -inc 10 && sigdwmblocks 6;;
    3) xbacklight -dec 10 && sigdwmblocks 6;;
esac
