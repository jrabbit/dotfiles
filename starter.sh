sudo apt-get install git docker.io terminator emacs redshift-gtk vlc npm htop nodejs-legacy gitg python-pip ngrok-client httpie xclip mosh \
    zsh ipython gnome-shell-pomodoro ack-grep virtualenv ruby-bcat twine deluge darktable apt-listbugs gist pcscd scdaemon pcsc-tools secure-delete \
    direnv hub yadm

# TODO: Add user to docker group

#steam deps
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6-i368 libgl1-nvidia-glx:i386

sudo apt-get -o Dpkg::Options::="--force-overwrite" install libuuid1:i386 
# Fixes stellaris

#oh my zshell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#js globals
#sudo npm install -g bower

sudo pip install vanity

# Configure!!
# `source /usr/local/bin/activate.sh` in .zshrc

#heroku 
#wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

sudo apt-get install postgresql-client ruby

# latex stuff optional
sudo apt-get install org-mode lyx
