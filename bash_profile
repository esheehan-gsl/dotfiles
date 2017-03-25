bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias ls="ls -G"
alias ll="ls -laGh"
alias datestamp="date '+%Y%m%d.%H%M%S'"

export HISTCONTROL=ignoreboth:erasedups

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

. ./Documents/dotfiles/gitprompt.sh

# virtualenv
export WORKON_HOME=~/.virtualenvs
. /usr/local/bin/virtualenvwrapper.sh

