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

