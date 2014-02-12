#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -f ~/.dir_colors ]] ; then
	eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
	eval $(dircolors -b /etc/DIR_COLORS)
fi
alias ls='ls --color=auto'
if [ $TERM == 'rxvt-unicode-256color' ]; then
  PS1="[\[\e[1;34m\]\u\e[1;37m\] at \[\e[0;34m\]\h\[\e[1;37m\]] [\[\e[0;31m\]\W\[\e[1;37m\]] [\[\e[1;33m\]\A\[\e[1;37m\]]\n\[\e[0;34m\]>> \[\e[1;37m\]"
else
  PS1="\[\e[1;36m\]\u@\h\[\e[0m\]\[\e[1;37m\] \W \$ \[\e[0m\]\[\e[0;37m\] "
fi
archey
