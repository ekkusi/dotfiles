#!/usr/bin/env bash

echo "Setting MacOS Settings..."

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Set Login Items
osascript -e 'tell application "System Events" to make login item at end with properties { path:"/Applications/LookAway.app", hidden:false }'
osascript -e 'tell application "System Events" to make login item at end with properties { path:"/Applications/Karabiner-Elements.app", hidden:false }'
osascript -e 'tell application "System Events" to make login item at end with properties { path:"/Applications/Rectangle.app", hidden:false }'
osascript -e 'tell application "System Events" to make login item at end with properties { path:"/Applications/Scroll Reverser.app", hidden:false }'
