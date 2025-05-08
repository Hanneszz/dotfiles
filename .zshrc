eval "$(starship init zsh)"
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

export PATH=$PATH:/usr/local/go/bin

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=50000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hanneszz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
