
# customize prompt
PROMPT='%(?.%F{green}%#.%F{red}%#%?) %F{magenta}%B%n%b %F{60}{ %F{cyan}%2~ %F{60}} %F{250}+>%F{orange} '
export CLICOLOR=1

# VCS in right prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# opam configuration
test -r /Users/gabor/.opam/opam-init/init.zsh && . /Users/gabor/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
