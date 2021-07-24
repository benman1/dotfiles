# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export PATH="$HOME/anaconda3/envs/py38/bin:$PATH"
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_github"
export MATPLOTLIBRC=".matplotlibrc"

