#!/bin/bash

#where the configuration files come from
DOTFILES_URL=https://github.com/CNUClasses/dotfiles.git
LOC=.cfg  #where config files go
NAME='Keith Perkins'
EMAIL='keith.perkins@cnu.edu'

#clone repo into ~/.cfg, --depth=1 gets only last commits (faster)
git clone --depth=1 $DOTFILES_URL ~/$LOC/

#if existing config files exist 
for p in .vimrc .tmux.conf .ctags .gitconfig
do
    #if there remove it
    if test ~/$p; then
        rm ~/$p 
    fi

    #symlink new config file
    ln -s ~/$LOC/$p ~/
done

#add any aliases
chmod 766 ~/$LOC/.bash_aliases 
source ~/$LOC/.bash_aliases

#add the following line to .bashrc so all subsequant terminal windows pick up aliases
echo "source ~/$LOC/.bash_aliases">>~/.bashrc 

#and the following line so that all shells run .bashrc
echo "source ~/.bashrc">>~/.bash_profile 

#config git
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"

git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'