#!/bin/bash
if [ ! -e /usr/local/bin/diff-highlight ]; then
    wget https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight &&\
    chmod +x diff-highlight &&\
    sudo mv diff-highlight /usr/local/bin
fi

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
