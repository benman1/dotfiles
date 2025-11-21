# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

autoload -U colors && colors

# Conda environment indicator
_conda_env() {
    [[ -n "$CONDA_DEFAULT_ENV" ]] && print -P "%F{magenta}($CONDA_DEFAULT_ENV)%f"
}

# Git branch indicator
_git_info() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local branch dirty
        branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)
        dirty=$(git status --porcelain 2>/dev/null)
        if [[ -n "$dirty" ]]; then
            print -P "%F{yellow} $branch*%f"
        else
            print -P "%F{green} $branch%f"
        fi
    fi
}

# MAIN PROMPT (NO SINGLE QUOTES)
export PROMPT=%F{cyan}%n@%m%f" "%F{blue}%~%f" "$(_conda_env)" "$(_git_info)" "%#" "

export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_github"
export MATPLOTLIBRC=".matplotlibrc"
export PIP_PREFER_BINARY=1
