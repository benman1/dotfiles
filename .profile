setopt PROMPT_SUBST

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ben/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ben/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ben/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ben/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

autoload -U colors && colors
setopt PROMPT_SUBST

# Conda environment
_conda_env() {
  [[ -n "$CONDA_DEFAULT_ENV" ]] && echo "%F{magenta}($CONDA_DEFAULT_ENV)%f"
}

# Git info
_git_info() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch dirty
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)
    dirty=$(git status --porcelain 2>/dev/null)
    if [[ -n "$dirty" ]]; then
      echo "%F{yellow}[${branch}*]%f"
    else
      echo "%F{green}[${branch}]%f"
    fi
  fi
}

# Build prompt safely before each display
precmd() {
  PROMPT_CONDA="$(_conda_env)"
  PROMPT_GIT="$(_git_info)"
}

# Main prompt (NO command substitution now)
PROMPT='%F{cyan}%n@%m%f %F{blue}%~%f ${PROMPT_CONDA} ${PROMPT_GIT} %# '

export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_github"
export MATPLOTLIBRC=".matplotlibrc"
export PIP_PREFER_BINARY=1

export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
PATH="${JAVA_HOME}/bin:${PATH}:/Applications/PyCharm.app/Contents/MacOS/"
export PATH

export M2_HOME="/opt/apache-maven-3.9.3"
PATH="${M2_HOME}/bin:${PATH}"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH="$PATH:/usr/local/bin/"
export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"
