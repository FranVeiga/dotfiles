#! /bin/sh

case $1 in
    1) amixer set Master 5%+ && sigdwmblocks 7;;
    2) pavucontrol;;
    3) amixer set Master 5%- && sigdwmblocks 7;;
esac
