#! /usr/bin/bash
desktop=$(bspc query -D -d focused --names)

bsp-layout get $desktop
