#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

####################################################################################
#######################               F U N C T I O N S        #####################
####################################################################################

#the brightness control function.
brightness(){
	sudo tee /sys/class/backlight/intel_backlight/brightness <<< $1	
	echo "Brightness level set to: $1"	
}
# the voulme control function
setvolume(){
	pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo $1%
	echo "Volume set to level: "$1
}
#let the ide functions begin
webstorm(){
	# run the license server before proceeding
	$HOME/.idea-server -u osama -p 5001 &
	sh $HOME/ides/web*/bin/webstorm.sh &
}
idea(){
	# run the license server before proceeding
	$HOME/.idea-server -u osama -p 5001 &
	sh $HOME/ides/idea/bin/idea.sh &
}
pycharm(){
	# run the license server before proceeding
	$HOME/.idea-server -u osama -p 5001 &
	sh $HOME/ides/pycharm*/bin/pycharm.sh &
}
phpstorm(){
	# run the license server before proceeding
	$HOME/.idea-server -u tripleheader -p 5001 &
	sh $HOME/ides/php*/bin/phpstorm.sh &
}


# mount the second partition
mountset(){
	sudo cryptsetup luksOpen /dev/sda4 Set
	sudo mount /dev/mapper/Set /media/osama/Set
	echo 'mounted at /media/osama/Set'
}

# get battery percentage
#battery_level() {
#	b=`acpi | grep -Eo '[0-9]{1,3}%'`
#	echo ${b%?}
#}
#mount usb
function mountusb(){
	DIRECTORY="/home/tripleheader/mnt"
	if [ ! -d "$DIRECTORY" ]; then
		mkdir "$DIRECTORY"
	fi
	sudo mount -t vfat $1 "$DIRECTORY" -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
       echo "Donnee. Mounted at $DIRECTORY"	
		
}
#untar function
untar(){
	tar -xvf $1
}
####################################################################################
#########        I N T E R F A C E    S T U F F aka bash prompot         ###########
####################################################################################

#REDCOLOR='\e[3#1m'
#BATCOLOR='\e[3#3m'
#GREENCOLOR='\e[3#2m'
#RESET='\e(b\e[m'
# I would like to display my battery percentage highlighted according to percentage.
#if [ "$(battery_level)" -lt "15" ]; then
#	PS1="[\#]\[$REDCOLOR\](\$(battery_level)%)\[$GREENCOLOR\]\W\[$RESET\] >"
#else
#	PS1="[\#]\[$BATCOLOR\](\$(battery_level)%)\[$REDCOLOR\]\W\[$RESET\] >"
#fi

####################################################################################
#######################           A L I A S      S E C T I O N        ##############
####################################################################################

alias sl='ls --color=auto'
alias ll='ls -l'
alias sduo='sudo'
alias azit='exit'
alias clr='clear'
alias rngr='ranger'
alias back='cd -'
alias cdset='cd /media/osama/Set'
alias copy='rsync -r -v --progress'
alias emulator='/home/tripleheader/Android/Sdk/tools/emulator -avd nexus -no-boot-anim -show-kernel -verbose '
alias hotspot='sudo create_ap wlp8s0 ppp0 tripleheader Mangoin4323' # no when near me gonna read this so I don't need to hide my pass
alias unmount='sudo umount ~/mnt'
alias bot='sudo /home/osama/.irc-bot/src/ircbot.py'
alias split-display='xrandr --output HDMI-1 --mode 1920x1200 --right-of eDP-1'
alias clone-display='xrandr --output HDMI-1 --same-as eDP-1'
alias off-display='xrandr --output eDP-1 --off'
alias revert-display='xrandr --output eDP-1 --mode 1366x768'
alias off-display2='xrandr --output HDMI-1 --off'
alias playmusic='mpv /home/osama/music/rockstart/* --no-audio-display'
alias android-studio='/home/tripleheader/Android/android-studio/bin/studio.sh &'

####################################################################################
##################            M I S C E L L A N E O U S          ###################
####################################################################################

#add path
PATH="$PATH:/home/osama/Android/android-sdk/tools"
#set java home
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
PATH=$JAVA_HOME/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
