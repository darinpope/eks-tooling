# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -last'

function uk() {
  aws eks --region $1 update-kubeconfig --name $2
}

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi