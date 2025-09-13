# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"

#starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"

#general settings
alias ll='ls -la --color=auto'
# alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias c='clear'
alias f='fastfetch'
alias ..='cd ..'
alias h='htop'
alias gcf='cd $HOME/.config'
alias x='exit'
alias bash='nvim ~/.bashrc'
alias nv="nvim"

#notes for Dropbox
NOTES_FILENAME="$(date +%F).md"
alias nn="mkdir ~/Dropbox/zettelkasten/JORNAL &> /dev/null; touch ~/Dropbox/zettelkasten/JORNAL/$NOTES_FILENAME; cd ~/Dropbox/zettelkasten/JORNAL; nvim ~/Dropbox/zettelkasten/JORNAL/$NOTES_FILENAME"
alias td="mkdir ~/Dropbox/zettelkasten/000_To_Do &> /dev/null; touch ~/Dropbox/zettelkasten/000_To_Do/00_To_Do.md; cd ~/Dropbox/zettelkasten/000_To_Do; nvim ~/Dropbox/zettelkasten/000_To_Do/00_To_Do.md"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

#FZF stuff
export FZF_DEFAULT_COMMAND='fd --hidden --type l --type f --type d --exclude .git --exclude .cache'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'" # prevew

complete -cf sudo

#timeshift
alias time="sudo -E timeshift-gtk"

# reinstate fzf custom options ('fzf-' as in 'cd -' as in 'back to where I was')
# alias fzf-="export FZF_DEFAULT_COMMAND='fd . $HOME'"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
