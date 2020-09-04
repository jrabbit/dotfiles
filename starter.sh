#!/bin/bash

function main_apps {
    sudo apt install git emacs-nox npm htop python-pip httpie xclip mosh \
    zsh ipython ack-grep virtualenv ruby-bcat twine apt-listbugs gist pcscd scdaemon pcsc-tools secure-delete \
    direnv hub yadm mtr-tiny postgresql-client ruby
}

sudo usermod -aG docker $USER

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

main_apps

#oh my zshell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
function pydev {
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	sudo apt-get install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
	mkdir $ZSH/plugins/poetry
	poetry completions zsh > $ZSH/plugins/poetry/_poetry
}

gui_extras
