#!/bin/bash

# remove amazon cruft, https://www.lifewire.com/remove-amazon-application-from-ubuntu-4134329
# sudo apt-get remove -y unity-webapps-common


# setup workspaces, ubuntu only?
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2

# setup keyboard shortcuts
## http://unix.stackexchange.com/questions/119432/save-custom-keyboard-shortcuts-in-gnome
## https://wiki.ubuntu.com/Keybindings
## http://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored
dconf load /org/gnome/desktop/wm/keybindings/ < $(readlink -f ubuntu-keybindings)
# setup terminal settings
ln -sf $(readlink -f %gconf.xml) ~/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml
