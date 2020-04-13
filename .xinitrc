#
# .xinitrc
#

# keyboard layout and binding capslock to escape
setxkbmap no
setxkbmap -option caps:swapescape

# touchpad settings
#
#xinput set-prop "DLL0665:01 06CB:76AD Touchpad" "Synaptics Tap Action" 0 & 
# this works for void

xinput set-prop "DLL0665:01 06CB:76AD Touchpad" "libinput Tapping Enabled" 1 & 
xinput set-prop "DLL0665:01 06CB:76AD Touchpad" "libinput Accel Speed" 0.2 &
# this works for arch

# wallpaper
#
#~/.fehbg &
#xsetroot -solid black
hsetroot -solid '#111'

# various services
#
picom &
xrdb -merge .Xresources &
#sxhkd &
xrandr --dpi 200 &
dunst &
polybar bar &


exec bspwm
