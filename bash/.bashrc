#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

# Testing this out. xterm-256color if not in tmux, but if in tmux, let it set TERM based on it's config
if [ "$TERM" != "screen-256color" ] && [ "$TERM" != "screen" ]; then
    TERM=xterm-256color
fi

# Fix VTE for tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    . /etc/profile.d/vte.sh
fi

# Fix VTE for termite
if [[ $TERM == xterm-termite ]]; then
    . /etc/profile.d/vte.sh
fi

## Some settings for bash history ##
# Increase the history size from the default 500
HISTSIZE=10000
# ignore repeated entries and entries starting with a space
HISTCONTROL=ignoreboth
# ignore certain commands
HISTIGNORE='ls:fg:bg:history'
# Store and print the time the command was first run
HISTTIMEFORMAT='[%F %T] '
# Append to the history file instead of overwriting it on exit
shopt -s histappend
# Add each command to the history immediately after execution
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# ssh-agent setup
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

if [ -f /home/dmartins/anaconda3/etc/profile.d/conda.sh ]; then
	. /home/dmartins/anaconda3/etc/profile.d/conda.sh
fi
