function toremote {
	ssh xeno@64.79.105.31
}

function topi {
	ssh xeno@192.168.0.4
}

alias syu='sudo pacman -Sy linux-headers --needed && sudo pacman -Su'

function take_pic {
	import -window root ~/screenshot.png
	imgurloader -filename /home/xeno/screenshot.png | xclip
	echo -e '\007'
}

function backup_dotfile {
	ORIGIN=`pwd`
	cp $1 $HOME/dev/dotfiles/
	cd $HOME/dev/dotfiles/
	git add $1
	git commit -m "Added $1"
	cd $ORIGIN
}
