
# My famous Git aliases
alias ga="git add"
alias gbv="git branch -v --sort=committerdate"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gs="git status"
alias gc="git commit"
alias grv="git remote -v"
alias gl="git log --pretty=oneline"
alias gg="git log --all --graph --oneline --decorate"
alias gdc="git diff --cached"
alias gp="git push"
alias gd="git diff --"
alias gcom="git checkout $(git rev-parse --abbrev-ref origin/HEAD | cut -c8-)"
alias gpu="git pull"
alias gpsu='git-push-set-upstream'
alias gbo='git-move-branch-to-origin'

unstage() {
    local pat=$1
    if [[ $# -eq 0 ]]; then
        pat=$(git diff --cached --name-only | fzf --preview 'git diff --color --cached {}')
    fi
    git reset HEAD $pat "${@:2}"
}
