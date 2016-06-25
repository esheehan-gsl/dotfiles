bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias ls="ls -G"
alias ll="ls -laGh"
alias datestamp="date '+%Y%m%d.%H%M%S'"

export PATH=./bin:./node_modules/.bin:/usr/local/bin:$PATH
export PS1="\e[36m\W \e[92m\$\e[0m "

# Keeps node from complaining
ulimit -S -n 2048

# Load bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f .git-completion.bash ]; then
    . .git-completion.bash
fi
