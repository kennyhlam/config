if [ $(whoami) != 'vagrant' ]; then # a base box, not vm
	# Maybe in the future, https://atom.io/

	cd ~/Downloads
	# http://www.technoreply.com/how-to-install-sublime-text-2-on-ubuntu-12-04-unity/
	curl -v http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2 --output "Sublime Text 2.0.2 x64.tar.bz2"
	tar -vxjf Sublime\ Text\ 2.0.2\ x64.tar.bz2
	sudo mv Sublime\ Text\ 2 /opt/
	sudo ln -sfn /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime

    # https://github.com/guillermooo/Vintageous#vintageous
	# http://www.sitepoint.com/10-essential-sublime-text-plugins-full-stack-developer/
	mkdir -p ~/.config/sublime-text-2/Installed\ Packages
	mkdir -p ~/.config/sublime-text-2/Packages
	cd ~/.config/sublime-text-2/Installed\ Packages
	# Package control
	wget https://sublime.wbond.net/Package%20Control.sublime-package
	# SynchedSideBar
	cd $HOME/Downloads
	wget https://github.com/sobstel/SyncedSideBar/archive/master.zip
	unzip master.zip && mv SyncedSideBar-master ~/.config/sublime-text-2/Packages/SyncedSideBar
	cd $HOME/Downloads
    rm master.zip
	# Focus file sidebar
	cd $HOME/Downloads
	wget https://github.com/miguelgraz/FocusFileOnSidebar/archive/master.zip
	unzip master.zip && mv FocusFileOnSidebar-master ~/.config/sublime-text-2/Packages/FocusFileOnSidebar
	cd $HOME/Downloads
    rm master.zip
	# All Autocomplete Sublime Text
	cd $HOME/Downloads
	wget https://github.com/alienhard/SublimeAllAutocomplete/archive/master.zip
	unzip master.zip && mv SublimeAllAutocomplete-master ~/.config/sublime-text-2/Packages/SublimeAllAutocomplete
	cd $HOME/Downloads
    rm master.zip
	# Sublimetext markdown preview
	cd $HOME/Downloads
	wget https://github.com/revolunet/sublimetext-markdown-preview/archive/master.zip
	unzip master.zip && mv sublimetext-markdown-preview-master ~/.config/sublime-text-2/Packages/sublimetext-markdown-preview
	cd $HOME/Downloads
    rm master.zip
	# Sublime terminal
	cd $HOME/Downloads
	wget https://github.com/wbond/sublime_terminal/archive/master.zip
	unzip master.zip && mv sublime_terminal-master ~/.config/sublime-text-2/Packages/sublime_terminal
	cd $HOME/Downloads
    rm master.zip
	# GitGutter
	cd $HOME/Downloads
	wget https://github.com/jisaacks/GitGutter/archive/master.zip
	unzip master.zip && mv GitGutter-master ~/.config/sublime-text-2/Packages/GitGutter
	cd $HOME/Downloads
    rm master.zip

    # let package control run and update
    /usr/bin/sublime&
    sleep(5)
    killall sublime
    /usr/bin/sublime&
    sleep(5)
    killall sublime

    sudo sh -c "curl -v https://raw.githubusercontent.com/kennyhlam/config/master/sublime.desktop --output /usr/share/applications/sublime.desktop" 
    sudo sed -i -e s/gedit/sublime/ defaults.list
    # must be run after sublime has initialized
	cd ~/.config/sublime-text-2/Packages/User
    rm Preferences.sublime-settings
    rm GitGutter.sublime-settings
    rm Default\ \(Linux\).sublime-keymap
	wget https://raw.githubusercontent.com/kennyhlam/config/master/Preferences.sublime-settings
	wget https://raw.githubusercontent.com/kennyhlam/config/master/GitGutter.sublime-settings
	wget "https://raw.githubusercontent.com/kennyhlam/config/master/Default%20(Linux).sublime-keymap"

	# maybes
	# Side​Bar​Enhancements, https://github.com/titoBouzout/SideBarEnhancements
	# SublimeREPL, https://github.com/wuub/SublimeREPL
	# DocBlock, https://github.com/spadgos/sublime-jsdocs
fi
