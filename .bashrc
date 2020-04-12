#
# .bashrc
#

# INFINITE HISTORY
HISTSIZE=HISTFILESIZE

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# use aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export PS1="\[\e[37m\][\[\e[m\]\[\e[31m\]\w\[\e[m\]\[\e[37m\]]\[\e[m\]> "
export PS2=">>> "

