source /usr/share/defaults/etc/profile

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

PATH="$PATH:$HOME/.local/bin"
PATH="$HOME/.cargo/bin:$PATH"
export PATH

complete -C aws_completer aws

[ -r /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -r /usr/share/bash-completion/completions/fzf ] && source /usr/share/bash-completion/completions/fzf

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dmartins/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dmartins/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dmartins/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dmartins/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

