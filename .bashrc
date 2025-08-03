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
alias f='fastfetch'
alias ..='cd ..'
alias h='htop'
alias m='micro'
alias gcf='cd $HOME/.config'
alias x='exit'
alias bash='nvim ~/.bashrc'
alias nv="nvim"
#git
# alias g='git'
# alias st='git status'
# alias com='git commit -m'
# alias clone='git clone'
# alias sth='git stash'
# alias lg='git log'
# alias u='git add -u'
# alias all='git add .'

#notes for Dropbox
NOTES_FILENAME="$(date +%F).md"
alias nn="mkdir ~/Dropbox/zettelkasten/JORNAL &> /dev/null; touch ~/Dropbox/zettelkasten/JORNAL/$NOTES_FILENAME; cd ~/Dropbox/zettelkasten/JORNAL; nvim ~/Dropbox/zettelkasten/JORNAL/$NOTES_FILENAME"

#notes for home folder
#NOTES_FILENAME="notes-$(date +%Y%m%d).md"
#alias nn="mkdir ~/notes &> /dev/null; touch ~/notes/$NOTES_FILENAME; cd ~/notes; micro ~/notes/$NOTES_FILENAME"

#BibleSearch
alias bsr='cd /home/alex/Dropbox/zettelkasten/BIBLE && ss'
alias bse='cd /home/alex/Dropbox/zettelkasten/BibleESV && ss'

#starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"

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

# Super Search. Define a function 'rgf' for ripgrep-fzf search
ss() {
  # Check if bat is installed for enhanced previews, otherwise fall back to cat
  local PREVIEW_CMD="cat"
  if command -v bat &>/dev/null; then
    PREVIEW_CMD="bat --color=always"
  else
    echo "Warning: 'bat' not found. Install it for better previews (e.g., 'brew install bat')." >&2
  fi

  # Ensure fzf-tmux is preferred for a floating window if tmux is running
  local FZF_BIN="fzf"
  if command -v fzf-tmux &>/dev/null && [ -n "$TMUX" ]; then
    FZF_BIN="fzf-tmux -p" # -p for popup window
  fi

  # The core fzf + ripgrep command
  # - --bind 'change:reload(...)': As you type (query changes), ripgrep is re-run
  #   - `rg --column --line-number --no-heading --color=always --smart-case --fixed-strings {q} || true`
  #     - `--column`: Include column number in output (useful but not used in this specific nvim binding for simplicity).
  #     - `--line-number`: Include line number. Essential for opening files at specific lines.
  #     - `--no-heading`: Don't print filename headers (fzf handles this better in preview).
  #     - `--color=always`: Force color output, which fzf's `--ansi` option then interprets.
  #     - `--smart-case`: Search case-insensitively unless the pattern contains uppercase letters.
  #     - `--fixed-strings`: Treat pattern as a literal string, not a regex. Remove for regex search.
  #     - `{q}`: This is fzf's placeholder for the current query string you are typing.
  #     - `|| true`: Prevents fzf from erroring out if ripgrep finds no matches (ripgrep exits with 1).
  # - --ansi: Tells fzf to interpret ANSI color codes from ripgrep.
  # - --preview "$PREVIEW_CMD {1} --highlight-line {2}": Shows content of the selected file.
  #   - `{1}`: The first field extracted by `--delimiter :` (which is the filename).
  #   - `{2}`: The second field (line number).
  #   - `--highlight-line {2}`: `bat` specific, highlights the matching line.
  # - --delimiter : --nth 3..: Parses ripgrep's output.
  #   - ripgrep output format: `filename:line_number:column_number:content` (with `--column`)
  #   - `--delimiter :`: Splits each line by colon.
  #   - `--nth 3..`: Displays only the content starting from the 3rd field. This hides filename and line number in the main fzf window, keeping it clean.
  # - --bind 'enter:execute(nvim +{2} {1})': When you press Enter, execute this command.
  #   - `nvim +{2} {1}`: Opens the file (`{1}`) in Neovim at the specified line number (`{2}`).
  #     Adjust `nvim` to your preferred editor (e.g., `vim`, `code --goto`).
  # - --header: Provides helpful text at the top of the fzf window.
  $FZF_BIN \
    --bind "change:reload(rg --column --line-number --no-heading --color=always --smart-case --fixed-strings {q} || true)" \
    --ansi \
    --preview "$PREVIEW_CMD {1} --highlight-line {2}" \
    --delimiter : \
    --nth 3.. \
    --bind 'enter:execute(nvim +{2} {1})' \
    --header "Type to search with ripgrep. Enter to open in micro."
}

# Add a simple alias to quickly get to your dotfiles directory and use rgf
# alias dotfrg='cd ~/.dotfiles && rgf' # Adjust ~/.dotfiles to your actual dotfiles path
