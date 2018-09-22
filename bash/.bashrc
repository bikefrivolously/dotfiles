#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

export VISUAL="vim"

# PATH is now set in ~/.xprofile. This makes it available to i3 and related graphical apps
#PATH=${PATH}:~/bin

# Trying out termite, which sets TERM to xterm-termite
#TERM=xterm-256color

# Fix VTE for tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi

# Fix VTE for termite
if [[ $TERM == xterm-termite ]]; then
    . /etc/profile.d/vte.sh
#    __vte_prompt_command
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
# Note - this needs to be after anything else that modifies PROMPT_COMMAND (like sourcing vte.sh)
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# termite needs BROWSER set to open URLs
export BROWSER=xdg-open

# ssh-agent setup
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

compile_and_run()
{
	src="$1"
	dest="${src%.*}"
	echo "Executing: $dest"
	echo "======================================================"
	g++ -Wall -Wpedantic --std=c++14 -o "$dest" "$src" && ./$dest
}

alias car=compile_and_run

if [ -f /home/dmartins/miniconda3/etc/profile.d/conda.sh ]; then
	. /home/dmartins/miniconda3/etc/profile.d/conda.sh
fi
