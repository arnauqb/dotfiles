# vim: filetype=i3
###################################################
#             Core i3 configuration               #
###################################################

# set super to modifier key
set $mod Mod4

# Font for window titles
font pango:monospace 10 

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec termite
#optional tmux
#bindsym $mod+Return exec termite -e tmux

# kill focused window
bindsym $mod+q kill

# start rofi
bindsym $mod+d exec --no-startup-id rofi -show run

#youtube trick music
bindsym $mod+y fullscreen disable; floating enable; resize set 600 400; sticky enable; move window to position 1940 54

bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

## Set shut down, restart and locking features
#bindsym $mod+p mode "$mode_system"
#set $mode_system (l)ock, (e)xit, switch_(u)ser, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
#mode "$mode_system" {
#    bindsym l exec --no-startup-id i3exit lock, mode "default"
#    bindsym s exec --no-startup-id i3exit suspend, mode "default"
#    bindsym u exec --no-startup-id i3exit switch_user, mode "default"
#    bindsym e exec --no-startup-id i3exit logout, mode "default"
#    bindsym h exec --no-startup-id i3exit hibernate, mode "default"
#    bindsym r exec --no-startup-id i3exit reboot, mode "default"
#    bindsym Shift+s exec --no-startup-id i3exit shutdown, mode "default"
#
#    # exit system mode: "Enter" or "Escape"
#    bindsym Return mode "default"
#    bindsym Escape mode "default"
#}

#################################################
#                 Navigation                    #
#################################################

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
#bindsym $mod+semicolon focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left 
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+b split h

# split in vertical orientation
bindsym $mod+v split v

#resize window
bindsym $mod+r mode "resize"
# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}
# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

#scratchpad
bindsym $mod+Shift+z move scratchpad
bindsym $mod+z scratchpad show

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

#######################################
#           Workspaces                #
#######################################

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10
bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev
# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

#apps to workspaces
#assign [class="Termite"] 1
#for_window [class="Termite"] focus
#assign [class="Firefox"] 2
#assign [class="Nightly"] 2
#assign [class="Rhythmbox"] 10


# polybar execute
exec_always pkill -9 polybar ; polybar top

# remove windows titles
new_window 1pixel 
#gaps
gaps inner 10
gaps outer 1

#windows borders
default_border pixel 0
#colors:                border  backgr.  text    indicator
client.focused          #ffffff #ffffff  #ffffff #ffffff
client.focused_inactive #ffffff #ffffff  #ffffff #2b2b2b
client.unfocused        #ffffff #c1c1c1  #ffffff #2b2b2b
client.urgent           #ffffff #900000  #ffffff #2b2b2b



######################################################
#          Volume / Brightness / Keyboard...         #
######################################################

#volume
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% & pactl set-sink-volume 1 +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% & pactl set-sink-volume 1 -5%
bindsym XF86AudioMute exec amixer -q set Master toggle 
# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbright +20
bindsym XF86MonBrightnessDown exec xbright -20
# reload the configuration file
#switch layout
bindsym ISO_Next_Group exec pkill -RTMIN+1 i3blocks
exec_always "setxkbmap -layout gb,es"
exec_always "setxkbmap -option 'grp:alt_shift_toggle'"
exec "xmodmap ~/.Xmodmap"


##########################################################
#                    Startup executions                  #
##########################################################

exec --no-startup-id nm-applet
exec_always feh --bg-scale ~/Pictures/wallpaper.png
exec --no-startup-id compton
exec --no-startup-id redshift-gtk
exec --no-startup-id flameshot
#natural scrolling and tab
exec xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1
exec xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 
exec xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Scrolling Distance" "-112" "-112"
#conky
#exec --no-startup-id conky --config=/home/arnau/.config/conky.conf
exec --no-startup-id xss-lock -- i3lock-fancy

#lock closing lid
#exec --no-startup-id i3lock -u ~/Pictures/planet.jpg

##########################################################
#             Application keybindings                    #
##########################################################

#aplicacions
bindsym $mod+g exec firefox-beta
bindsym $mod+t exec telegram-desktop
bindsym $mod+Shift+t exec slack
bindsym $mod+n exec termite -e ranger
bindsym $mod+shift+n exec nautilus 
bindsym $mod+shift+Return exec tdrop -a termite
bindsym $mod+m exec tdrop -a nautilus
bindsym $mod+c exec emacs
#lock
bindsym $mod+x exec i3lock-fancy
bindsym Print exec flameshot gui
