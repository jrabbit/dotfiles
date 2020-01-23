#!/bin/bash

function main_apps {
    sudo apt install git emacs npm htop python-pip httpie xclip mosh \
    zsh ipython ack-grep virtualenv ruby-bcat twine apt-listbugs gist pcscd scdaemon pcsc-tools secure-delete \
    direnv hub yadm mtr-tiny postgresql-client ruby
}

# TODO: Add user to docker group

function steam_32bit_setup {
    #steam deps 32bit old
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt-get install libc6-i368 libgl1-nvidia-glx:i386

    sudo apt-get -o Dpkg::Options::="--force-overwrite" install libuuid1:i386 
    # Fixes stellaris
}

function gui_extras {
    #latex
    sudo apt install org-mode lyx vlc gitg xclip gnome-shell-pomodoro deluge darktable flameshot terminator
}

mainapps

#oh my zshell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#js globals
#sudo npm install -g bower

# does this still work? 1/2020
sudo pip install vanity

gui_extras