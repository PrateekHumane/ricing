#!/bin/sh

# This script is called on startup to remap keys.
# Increase key speed via a rate change
xset r rate 300 50
# Map the caps lock key to escape 
# And right alt to compose 
setxkbmap -option "caps:escape"

# Map the menu button to left super
# xmodmap -e 'keycode 135 = Super_L'

# Map the printscreen button to right super
# xmodmap -e 'keycode 107 = Super_R'

# Turn off the caps lock if on since there is no longer a key for it.
xset -q | grep "Caps Lock:\s*on" && xdotool key Caps_Lock

# Speed up mouse
# xinput set-prop 13 314 0.8
