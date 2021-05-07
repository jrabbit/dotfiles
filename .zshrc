
# Path to your oh-my-zsh installation.
export ZSH=/home/jack/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"
#ZSH_THEME="spaceship"
ZSH_THEME_RANDOM_IGNORED=(kennethreitz rkj-repos)
GOOD_LIST=(sonicradish fino-time)
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export PATH="/home/jack/.pyenv/bin:/home/jack/.local/bin:/usr/local/bin:/snap/bin:/usr/bin:/bin:/usr/local/games:/usr/games"


plugins=(gitfast mosh gh)
if [[ -e ~/.poetry/bin/poetry ]] then
	plugins+=(poetry)
	export PATH="$HOME/.poetry/bin:$PATH"
fi
if [[ -e docker ]] then
	plugins+=(docker docker-compose)
fi


source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export DEB_BUILD_OPTIONS="parallel=4"
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
setopt histignorespace

alias gitg="(gitg  &) &> /dev/null"
alias ego="vanity hitman pyborg materialdjango taskc"
alias duf="duf -hide special,loops"

# golang
export GOPATH="/home/jack/Projects/Go"
#export GOROOT="/usr/lib/go-1.13/"
export PATH=$HOME/.yarn/bin:$PATH:$GOPATH/bin:$GOROOT/bin

# add virtualenv wrapper
export WORKON_HOME=~/.python_envs
if [[ -a /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]]
then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
if [[ -a $HOME/.pyenv/bin/pyenv ]] then
	eval "$(pyenv init -)"
fi
if [[ -a ~/.poetry/bin/poetry ]] then	
	export PATH=$HOME/.poetry/bin:$PATH
fi
function do_p_venv(){
    source `poetry env info -p`/bin/activate
}

alias doop=do_p_venv

#rust
if [[ -a ~/.cargo/env ]]
then
	source $HOME/.cargo/env
fi

#ruby
if [[ -a ~/.rbenv/bin/rbenv ]]
then
	export PATH=$HOME/.rbenv/bin/:$PATH
	eval "$(rbenv init -)"
fi

#invoke completeion script
if [[ -a ~/.local/bin/invoke.complete ]]
then
	source $HOME/.local/bin/invoke.complete
fi

REPORTTIME=5
export EDITOR=micro

# Fix pinentry problems
export GPG_TTY=`tty`

if [[ ! -w /var/run/docker.sock ]]
then
	alias _anywhere_docker="sudo docker"
else
	alias _anywhere_docker="docker"
fi

alias pull_ctop="_anywhere_docker pull quay.io/vektorlab/ctop:latest"

alias ctop="_anywhere_docker run --rm -it --name=ctop -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest"

#spaceship config
export SPACESHIP_BATTERY_SHOW=false

#auto env via direnv
if [[ -a direnv ]] 
then
	eval "$(direnv hook zsh)"
fi

if [[ -a ~/.config/jack.laxson/localrc ]]
then
  source ~/.config/jack.laxson/localrc
fi


function safe_tmux(){
    if [[ -v TMUX ]]
    then
        tmux "$@"
    fi
}

function ssh(){
    trap '
        safe_tmux set-window-option automatic-rename "on" 1>/dev/null
        safe_tmux set-option -g allow-rename on 1>/dev/null
    ' ZERR
    safe_tmux rename-window "ssh: ${@: -1}"
    safe_tmux set-option -g allow-rename off
    command ssh "$@"
    safe_tmux set-window-option automatic-rename "on" 1>/dev/null
    safe_tmux set-option -g allow-rename on
}

function mosh(){
    trap '
        safe_tmux set-window-option automatic-rename "on" 1>/dev/null
        safe_tmux set-option -g allow-rename on 1>/dev/null
    ' ZERR
    safe_tmux rename-window "mosh: ${@: -1}"
    safe_tmux set-option -g allow-rename off
    command mosh "$@"
    safe_tmux set-window-option automatic-rename "on" 1>/dev/null
    safe_tmux set-option -g allow-rename on
}

function nogfx(){
	sudo systemctl stop gdm3
	sudo zsh -c "echo 0 >> /sys/class/backlight/intel_backlight/brightness"
}

function yesgfx(){
	sudo systemctl start gdm3
	sudo zsh -c "echo 2000 >> /sys/class/backlight/intel_backlight/brightness"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jack/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/jack/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jack/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jack/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[[ -s "/home/jack/.gvm/scripts/gvm" ]] && source "/home/jack/.gvm/scripts/gvm"
