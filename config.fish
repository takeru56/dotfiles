# alias 
alias td='cd ~/Desktop'
alias ls='gls --color=auto'
alias be='bundle exec'
alias tp='cd ~/projects'
alias dt='cd ~/dotfiles'
alias tg='cd ~/projects3/go-pro/src/github.com/takeru56'
alias nv='nvim'
alias gs='git status'
alias gc='git checkout'
alias gb='git branch'
alias gpo='git push origin master'
alias gph='git push heroku master'

# ファイル作って入る
function mkcd
  mkdir $argv;
  cd $argv;
end

# docker-compose "処理"
function dc
  command docker-compose $argv;
end

function gcm
  command git commit -m $argv;
end
