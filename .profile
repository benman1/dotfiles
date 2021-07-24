# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export PROMPT='%F{blue}%1~%f %# '

export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_github"
export MATPLOTLIBRC=".matplotlibrc"

