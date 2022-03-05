#!/bin/bash

HPATH="$(eval echo "~$USER")"
MRROOT=$HPATH/.cache/mutter-rounded
MRPATH=$HPATH/.cache/mutter-rounded/mutter-rounded
TOOLPATH=$HPATH/.cache/mutter-rounded/mutter-rounded/tool
PACKAGEPATH=$HPATH/.cache/mutter-rounded/mutter-rounded/ubuntu_21.10
PACKAGESCRIPT=$HPATH/.cache/mutter-rounded/mutter-rounded/ubuntu_21.10/package.sh

# Send notice that update has started. 
notify-send 'mr-updater' 'mutter-rounded update has started. We will let you know when it is complete.' --icon=dialog-information

CLEANUP="true"
if [ -f $TOOLPATH ]; then
	CLEANUP="true"
fi

echo "Mutter has been updated and has triggered the mutter-rounded updater script to update" 
echo "you might experience color issues and no blue or rounded corner effects if this is not done."
if [ -f $TOOLPATH ]; then
	read -t 10 -p "Do you want to update mutter-rounded (y/n)?" choice
	case "$choice" in 
	  y|Y ) echo "yes" && CLEANUP="true";;
	  n|N ) echo "no" && CLEANUP="false" && echo "OK. You're the boss";;
	  * ) echo "invalid";;
	esac
	
fi

if [ $CLEANUP = "true" ]; then
	sudo rm -rf $HPATH/.cache/mutter-rounded
	echo "old version of mutter-rounded is cleared. Moving on to installing updates"
fi

if test -f "$PACKAGESCRIPT"; then
    echo "$PACKAGESCRIPT exists."
else
	mkdir -p $MRROOT
	cd $MRROOT
	git clone https://github.com/electrikjesus/mutter-rounded mutter-rounded
	cd $PACKAGEPATH
fi

if [ -d $MRPATH ]; then
cd $PACKAGEPATH
./package.sh
echo "mutter-rounded is compiled. Now installing..."
sudo dpkg -i $PACKAGEPATH/*.deb
cd $HPATH

echo "All set. Thanks for installing."

# Send notice that update has finished. 
notify-send 'mr-updater' 'mutter-rounded has been updated. Please restart before results can be used.' --icon=dialog-information

else
echo "There was an issue. Not installed"
# Send notice that update has finished. 
notify-send 'mr-updater' 'mutter-rounded had an issue and was not updated. Please use the "trigger-update.sh command from terminal to find out why".' --icon=dialog-information
fi
