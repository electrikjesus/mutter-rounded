# mutter-rounded updater

**For Ubuntu-21.10 only**

This is a simple systemd service that will monitor /usr/bin/mutter for updates, and if found, it will start the trigger-update.sh script. 
This creates a tempory folder (~/.cache/mutter-rounded) and clones our repo in case there are any updates, then it runs the 
ubuntu_21.10/package.sh script

To install, clone this repo, then cd into the mr-updater folder and open a terminal, then run:

	./install.sh

