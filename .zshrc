autoload -Uz compinit
compinit

# fzf
bindkey "ç" fzf-cd-widget
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim key bindings
bindkey -v
alias vim=nvim

# kube
alias kubectl="minikube kubectl --"
alias k="kubectl"
source <(kubectl completion zsh)

# theme
ZSH_THEME="catppuccin"

# git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gb="git branch"

# swift
alias sb="swift build"
alias sr="swift run"
