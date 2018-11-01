# alias 
alias td='cd ~/Desktop'
alias ls='gls --color=auto'
alias be='bundle exec'
alias tp='cd ~/projects'
alias dt='cd ~/dotfiles'
alias nv='nvim'
alias gs='git status'
alias gc='git checkout'
alias gpo='git push origin master'

# ファイル作って入る
function mkcd
  mkdir $argv;
  cd $argv;
end

# docker-compose "処理"
function dc
  command docker-compose $argv;
end

