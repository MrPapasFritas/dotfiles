#!/bin/sh
xrdb -merge ~/.Xresources
setxkbmap latam

sxhkd &
exec bspwm
