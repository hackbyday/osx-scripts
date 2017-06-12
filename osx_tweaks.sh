#!/bin/bash
#
# osx_tweaks.sh - change some of OSX's default behaviour
#
# A number of items were borrowed from this script:
#  - https://gist.github.com/saetia/1623487
#

# check we are root
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root, or with sudo" 1>&2
	exit 1
fi

# tweak power settings so laptop doesnt go to sleep
pmset -a sleep 0

# prevent creation of .DS_Store files on network locations
# refer https://support.apple.com/en-au/ht1629
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# show path bar in finder
defaults write com.apple.finder ShowPathbar -bool true

# use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# set default Finder location to home folder (~/)
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# make top-right hotspot start screensaver
defaults write com.apple.dock wvous-tr-corner -int 5 && \
defaults write com.apple.dock wvous-tr-modifier -int 0

# show the ~/Library folder
#chflags nohidden ~/Library

# show absolute path in finder's title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
