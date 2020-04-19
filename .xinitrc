#
# .xinitrc
#

xrandr --output HDMI1 --left-of eDP1
#enact --pos top

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
hsetroot -solid '#0f0f0f'

# various services
#
picom &
xrdb -merge .Xresources &
#sxhkd &
xrandr --dpi 200 &
dunst &
polybar bar &


exec bspwm
