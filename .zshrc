# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload colors && colors

# Use LS_COLORS from ls-colors-git package
source /usr/share/LS_COLORS/dircolors.sh

# The following lines were added by compinstall

zstyle ':completion:*' add-space true
zstyle ':completion:*' auto-description '%F{#808080}Specify: %F{#A080A0}%d%F{#FFFFFF}'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format '%F{#808080}Completing %F{#A080A0}%d%F{#FFFFFF}'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=3
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt '%F{#808080}Correction: %F{#A080A0}%e %F{#808080}errors%F{#FFFFFF}'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/gabor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=1750
setopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

EDITOR='vi -e'
VISUAL='vim'

alias ls="ls --color=auto"
alias grep='grep --color=auto'

# Movement keybindings
# Ctrl+Left/Right
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3~' delete-char
bindkey '^[[3;5~' delete-word
bindkey '^H' backward-delete-word

# Home / End
bindkey '^[[H' beginning-of-line

# History search keybindings
bindkey '^[[1;2F' autosuggest-accept
# Accept with END
bindkey -s '^[[F' '^[[1;2F^E'
bindkey '^[[A' history-search-backward
# bindkey -s '^[[A' '^[[1;2F'
bindkey '^[[B' history-search-forward

# Use fzf for fuzzy backward history search (Ctrl+R under -e keybindings, ** globs, etc.)
eval "$(fzf --zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gabor/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

if [ -f "/home/gabor/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/gabor/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# LaTeX support
PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"
MANPATH="/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH"
INFOPATH="/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH"

# Dotfiles git config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Customize prompt
# autoload -U promptinit; promptinit
# prompt bart
# Powerlevel 10k prompt
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fish autosuggestion port
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gabor/google-cloud-sdk/path.zsh.inc' ]; then . '/home/gabor/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gabor/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/gabor/google-cloud-sdk/completion.zsh.inc'; fi
