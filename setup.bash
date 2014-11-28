#!/bin/bash

# install commands
sudo apt-get -y install git zsh vim curl nkf
# for mac
# brew install git zsh vim curl nkf

# install oh-my-zsh
# ihttps://github.com/robbyrussell/oh-my-zsh
curl -L http://install.ohmyz.sh | sh
chsh -s `which zsh`

# install spf13-vim
# https://github.com/spf13/spf13-vim
sh <(curl https://j.mp/spf13-vim3 -L)

# setup gnome terminal color
# https://github.com/Anthony25/gnome-terminal-colors-solarized
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/
(cd ~/gnome-terminal-colors-solarized; ./install.sh;)

# dircolors
# https://github.com/seebi/dircolors-solarized
# http://michaelheap.com/getting-solarized-working-on-ubuntu/
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark > ~/.dircolors
