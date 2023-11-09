alias ls="ls --color=auto"
alias ll="ls -l"
alias a="php artisan"
alias c="composer"
alias e="cd /var/www/html"

export PS1="\[\033[33;1m\]\w\[\033[m\] (\[\033[30;1m\]$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[\033[m\]) $  \n $ "

if [ -f /etc/profile.d/bash_completion.sh ]; then
  . /etc/profile.d/bash_completion.sh
fi


if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# export PS1="\u@\h: \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
export PS1="\[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
# clear
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
[ ! -z "$TERM" -a -r /etc/motd ]  && cat /etc/motd
cd /var/www/html
echo
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
motivate
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo
date
echo
