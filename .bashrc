#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Set editors
EDITOR='vi -e'
VISUAL='vim'

# Set up fzf fuzzy search instead of built-in Ctrl-R backward history substring search
eval "$(fzf --bash)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gabor/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gabor/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/gabor/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gabor/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

