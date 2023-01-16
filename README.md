Setup config files , a few aliases and git configuration on a new ubuntu machine

The approach used here is from https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

Run the following commands in a terminal window on new machine

    wget "https://raw.githubusercontent.com/CNUClasses/dotfiles/master/setup.sh"
    chmod 766 setup.sh
    source ./setup.sh  

    #add the following line to .bashrc so all subsequant terminal windows pick up aliases
    source ~/.cfg/.bash_aliases 
In that script, change `https://github.com/fastai/dotfiles.git` to your fork, before you run it.
