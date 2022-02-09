#!/usr/bin/env bash

# Waydroid Session Installer
# 
# This will install Mutter & Weston session managers, and setup the 
# Waydroid session options for them

HPATH=$HOME
CONFIG="false"

sudo cp -rp usr/* /usr/
sudo cp -rp etc/* /etc/

sudo systemctl enable mutter-rounded-mon.path
sudo systemctl start mutter-rounded-mon.service

echo "All set. Thanks for installing."
