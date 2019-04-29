# alias 
alias td='cd ~/Desktop'
alias tg='cd ~/projects3/go-pro/src/github.com/takeru56'
alias be='bundle exec'
alias tp='cd ~/projects'
alias dt='cd ~/dotfiles'
alias nv='nvim'
alias gs='git status'
alias gc='git checkout'
alias gpo='git push origin master'

# ファイル作って入る
function mkcd(){
  mkdir $1;
  cd $1;
}

# docker-compose "処理"
function dc(){
  docker-compose $1;
}
