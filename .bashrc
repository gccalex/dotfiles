#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='ls -la --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias c='clear'
alias n='neofetch'
alias ..='cd ..'

#git 
alias g='git'
alias st='git status'
alias com='git commit -m'
alias clone='git clone'
alias sth='git stash'
alias lg='git log'
alias u='git add -u'
alias all='git add .'
alias x='exit'

#notes
NOTES_FILENAME="notes-$(date +%Y%m%d).md"
alias nn="mkdir ~/notes &> /dev/null; touch ~/notes/$NOTES_FILENAME; cd ~/notes; nano ~/notes/$NOTES_FILENAME"

#starship 
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"
