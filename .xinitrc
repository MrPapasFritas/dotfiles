#!/bin/sh
xrdb -merge ~/.Xresources
setxkbmap latam

exec bspwm
