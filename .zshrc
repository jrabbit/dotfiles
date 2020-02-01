
# Path to your oh-my-zsh installation.
export ZSH=/home/jack/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"
#ZSH_THEME="spaceship"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(poetry git mosh docker docker-compose)

# User configuration

export PATH="/home/jack/.pyenv/bin:/home/jack/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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


# golang
export GOPATH="/home/jack/Projects/Go"
export GOROOT="/usr/lib/go-1.13/"
export PATH=$HOME/.yarn/bin:$PATH:$GOPATH/bin:$GOROOT/bin

# add virtualenv wrapper
export WORKON_HOME=~/.python_envs
if [[ -a /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]]
then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

eval "$(pyenv init -)"
export PATH=$HOME/.poetry/bin:$PATH

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

alias pull_ctop="docker pull quay.io/vektorlab/ctop:latest"
alias ctop="docker run --rm -it --name=ctop -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest"

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
    ' ZERR
    safe_tmux rename-window "ssh: ${@: -1}"
    command ssh "$@"
    safe_tmux set-window-option automatic-rename "on" 1>/dev/null
}

function mosh(){
    trap '
        safe_tmux set-window-option automatic-rename "on" 1>/dev/null
    ' ZERR
    safe_tmux rename-window "mosh: ${@: -1}"
    command mosh "$@"
    safe_tmux set-window-option automatic-rename "on" 1>/dev/null
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jack/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/jack/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jack/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jack/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
