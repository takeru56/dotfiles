# alias
alias td='cd ~/Desktop'
alias tb='cd ~/blog/content/posts'
alias be='bundle exec'
alias tp='cd ~/projects5'
alias tre='cd ~/research'
alias dt='cd ~/dotfiles'
alias tg='cd ~/go/1.14.6/src/github.com/takeru56'
alias nv='nvim'
alias gs='git status'
alias gb='git branch'
alias gpo='git push origin master'
alias gph='git push heroku master'

function dc(){
  docker-compose $1;
}

function gc() {
  git commit "$1"
}
