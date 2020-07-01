#
# .xinitrc
#

xrandr --output HDMI1 --left-of eDP1
#enact --pos top

# keyboard layout and binding capslock to escape
setxkbmap us
#setxkbmap no
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
hsetroot -solid '#000000'

#cd ~/bin/autowall
#./autowall &
#cd ~

# various services
#
# window shadows
#picom -C -f -D 1 -I 0.02 -O 0.04 -c -r 1 -l 16 -t 16 --vsync --backend glx --shadow-exclude "_NET_FRAME_EXTENTS@:c" &
picom &
xrdb -merge .Xresources &
sxhkd &
xrandr --dpi 200 &
dunst &
#polybar bar &

emcas --daemon &

#~/bin/dwmbar &

exec bspwm
#~/bin/startdwm
