bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias ls="ls -G"
alias ll="ls -laGh"

export PATH=./node_modules/.bin:/usr/local/bin:$PATH
export PS1="\e[92m\h:\e[36m\W \e[92m\$\e[0m "

# Keeps node from complaining
ulimit -S -n 2048

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
