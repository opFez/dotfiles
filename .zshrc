HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/erik/.zshrc'

autoload -Uz compinit
compinit

# ^ all above is made by the new-user script

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export PS1='[%F{red}%~%f]> '
export PS2='>>> '
