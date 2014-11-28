#!/bin/bash
if [ ! -e /usr/local/bin/diff-highlight ]; then
    wget https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight &&\
    chmod +x diff-highlight &&\
    sudo mv diff-highlight /usr/local/bin
fi

ln -s ~/dotfiles/.vimrc.local ~/.vimrc.local
ln -s ~/dotfiles/.vimrc.bundles.local ~/.vimrc.bundles.local
ln -s ~/dotfiles/.zshrc.local ~/.zshrc.local
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
