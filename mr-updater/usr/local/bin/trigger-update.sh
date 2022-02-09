#!/bin/bash

HPATH=$HOME
MRROOT=$HPATH/.cache/mutter-rounded
MRPATH=$HPATH/.cache/mutter-rounded/mutter-rounded
TOOLPATH=$HPATH/.cache/mutter-rounded/mutter-rounded/tool
PACKAGEPATH=$HPATH/.cache/mutter-rounded/mutter-rounded/ubuntu_21.10
PACKAGESCRIPT=$HPATH/.cache/mutter-rounded/mutter-rounded/ubuntu_21.10/package.sh

CLEANUP="false"
if [ -f $TOOLPATH ]; then
	CLEANUP="true"
fi

echo "Mutter has been updated and has triggered the mutter-rounded updater script to update" 
echo "you might experience color issues and no blue or rounded corner effects if this is not done."
if [ -f $TOOLPATH ]; then
	read -p "Do you want to update mutter-rounded (y/n)?" choice
	case "$choice" in 
	  y|Y ) echo "yes" && CLEANUP="true";;
	  n|N ) echo "no" && echo "OK. You're the boss";;
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
	git clone https://github.com/yilozt/mutter-rounded mutter-rounded
	cd $PACKAGEPATH
fi

if [ -d $MRPATH ]; then
cd $PACKAGEPATH
./package.sh
echo "mutter-rounded is compiled. Now installing..."
sudo dpkg -i *.deb
cd $HPATH

echo "All set. Thanks for installing."
else
echo "There was an issue. Not installed"
fi
