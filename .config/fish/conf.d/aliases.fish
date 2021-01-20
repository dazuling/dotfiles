alias vim='nvim'

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias info='info --vi-keys'  # Emacs and cheese not allowed.
alias gname='git config user.name; git config user.email'
alias gupd='git add .; git commit -m update'
alias gitlines='git ls-files | xargs -d "\n" wc -l'
alias gst='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
alias gr='cd (git rev-parse --show-toplevel)'

alias rscp='rsync -ah --progress'

alias w='cd ~/notes; vim index.md'

alias is='bubblegum upload (/bin/ls -d1t ~/images/scrots/* | head -n1)'
alias iu='bubblegum upload'
alias ims='bubblegum upload --host=imgur.com (/bin/ls -d1t ~/images/scrots/* | head -n1)'
alias imu='bubblegum upload --host=imgur.com'

alias tn='tmux new -s'
alias ta='tmux attach -t'

alias zc='zotcli'