# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias uk='aws eks --region $1 update-kubeconfig --name $2'
alias ll='ls -last'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi