HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
unsetopt beep
bindkey -v # vi-mode!!
zstyle :compinstall filename '/home/erik/.zshrc'

# autocomplete
autoload -Uz compinit
compinit

# ^ all above is made by the new-user script



_comp_options+=(globdots) # include hidden files for autocomplete

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# open command for editing in (n)vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^f' edit-command-line

# apparently you should add this with vi-mode
export KEYTIMEOUT=1

# display vi-mode mode
function zle-line-init zle-keymap-select {
    vi_mode="${${KEYMAP/vicmd/normal}/(main|viins)/insert}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# prompt
setopt prompt_subst # to allow for ${variables}
export PS1='%f[%F{red}%~%f]> '
export PS2='%f>>> '
export RPS1='%F{243}${vi_mode}'

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh > /dev/null
