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

# reverse command search
bindkey '^R' history-incremental-search-backward

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
export PS1='%f[%F{cyan}%~%f]> '
export PS2='%f>>> '
export RPS1='%F{243}${vi_mode}'

# nnn cd on quit
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh > /dev/null
