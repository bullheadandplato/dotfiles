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
	sh $HOME/ides/web*/bin/webstorm.sh &
}
idea(){

	sh $HOME/ides/idea/bin/idea.sh &
}
pycharm(){

	sh $HOME/ides/pycharm*/bin/pycharm.sh &
}
phpstorm(){
 
	sh $HOME/ides/php*/bin/phpstorm.sh &
}
datagrip(){
	sh $HOME/ides/datagrip/bin/datagrip.sh &
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
export PS1="\[$(tput setaf 5)\]\[$(tput bold)\]\h \W >> \[$(tput sgr0)\]"
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
alias copy='rsync -r -v --progress'
alias hotspot='sudo create_ap wlp8s0 ppp0 tripleheader Mangoin4323' # no one near me gonna read this so I don't need to hide my pass
alias unmount='sudo umount ~/data'
alias copy='rsync -r -v --progress'
alias emulator='$HOME/Android/Sdk/tools/emulator -avd nexus -no-boot-anim -show-kernel -verbose -use-system-libs'
alias split-display='xrandr --output HDMI-1 --mode 1920x1200 --right-of eDP-1'
alias clone-display='xrandr --output HDMI-1 --same-as eDP-1'
alias off-display='xrandr --output eDP-1 --off'
alias revert-display='xrandr --output eDP-1 --mode 1366x768'
alias off-display2='xrandr --output HDMI-1 --off'
alias android-studio='$HOME/Android/android-studio-beta/bin/studio.sh &'
alias netcon='sudo systemctl start netctl@wifibb'
alias qt='$HOME/.Qt5.6.2/Tools/QtCreator/bin/qtcreator &'
alias mntdata='sudo cryptsetup luksOpen /dev/sda3 data && sudo mount /dev/mapper/data /home/bullhead/data && echo "Sucessfully mounted."'
alias playmusic='mpv $HOME/data/music/*  --no-audio-display'
alias webmode='sudo systemctl start httpd && sudo systemctl start mariadb'
alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman-mirrors -g && sudo pacman -Syyuu  &&
sudo pacman -Suu'
alias rex='xrdb ~/.Xresources'
alias nasheeds='mpv $HOME/data/nasheeds/* --no-audio-display'

####################################################################################
##################            M I S C E L L A N E O U S          ###################
####################################################################################

#add path
PATH="$PATH:$HOME/Android/android-sdk/tools"
PATH="$PATH:$HOME/.scripts/"
#set java home
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
PATH=$JAVA_HOME/bin:$PATH
BROWSER=/usr/bin/xdg-open


ESC=$'['
END_ESC=m

NOPRINT='\['
END_NOPRINT='\]'

WRAP="$NOPRINT$ESC"
END_WRAP="$END_ESC$END_NOPRINT"

RESET="${WRAP}0${END_WRAP}"
RESET_BG="${WRAP}49${END_WRAP}"

NORMAL="${WRAP}21${END_WRAP}"
BOLD="${WRAP}1${END_WRAP}"

function __fg_color {
    printf "%s" "${WRAP}38;5;${1}${END_WRAP}"
}

function __bg_color {
    printf "%s" "${WRAP}48;5;${1}${END_WRAP}"
}

BLACK=$(__fg_color 0)
RED=$(__fg_color 1)
GREEN=$(__fg_color 2)
YELLOW=$(__fg_color 3)
BLUE=$(__fg_color 4)
PURPLE=$(__fg_color 5)
CYAN=$(__fg_color 6)
WHITE=$(__fg_color 7)

ALT_BLACK=$(__fg_color 8)
ALT_RED=$(__fg_color 9)
ALT_GREEN=$(__fg_color 10)
ALT_YELLOW=$(__fg_color 11)
ALT_BLUE=$(__fg_color 12)
ALT_PURPLE=$(__fg_color 13)
ALT_CYAN=$(__fg_color 14)
ALT_WHITE=$(__fg_color 15)

BLACK_BG=$(__bg_color 0)
RED_BG=$(__bg_color 1)
GREEN_BG=$(__bg_color 2)
YELLOW_BG=$(__bg_color 3)
BLUE_BG=$(__bg_color 4)
PURPLE_BG=$(__bg_color 5)
CYAN_BG=$(__bg_color 6)
WHITE_BG=$(__bg_color 7)

ALT_BLACK_BG=$(__bg_color 8)
ALT_RED_BG=$(__bg_color 9)
ALT_GREEN_BG=$(__bg_color 10)
ALT_YELLOW_BG=$(__bg_color 11)
ALT_BLUE_BG=$(__bg_color 12)
ALT_PURPLE_BG=$(__bg_color 13)
ALT_CYAN_BG=$(__bg_color 14)
ALT_WHITE_BG=$(__bg_color 15)

export GPG_TTY=$(tty)
