#! /bin/sh
# 新規PCのaliesとvimのセットアップ用

#---------------------- 
# TO DO
# ・alies setting
# ・vim's set up
#----------------------

echo "### set up bash profile & bashrc"

if test -e ~/.bash_profile -a -e ~/.bashrc; then
  echo "#.bash profile and .bashrc exists"
  echo 'test2 -r ~/.bashrc && . ~/.bashrc' >> ~/.bash_profile
else
  echo "#.bash profile or .bashrc do not exist!! Please make sure!"
fi

# alies setting
echo "### set up aliases" >> ~/.bashrc

echo "alias td='cd ~/Desktop'" >> ~/.bashrc 
echo "alias be='bundle exec'" >> ~/.bashrc 
echo "alias tp='cd ~/projects'" >> ~/.bashrc 
echo "alias dt='cd ~/dotfiles'" >> ~/.bashrc 
echo "alias nv='nvim'" >> ~/.bashrc
echo "alias gs='git status'" >> ~/.bashrc
echo "alias gc='git checkout'" >> ~/.bashrc
echo "alias gb='git branch'" >> ~/.bashrc
echo "alias gpo='git push origin master'" >> ~/.bashrc
echo "function dc(){docker-compose \$1;}" >> ~/.bashrc
echo "# fish shell を起動" >> ~/.bashrc
echo "exec fish" >> ~/.bashrc

# vim setting
echo "### set up vim"

if test -e ~/.vim/dein/repos/github.com/Shougo/dein.vim; then
  echo "# dein is allready installed"
else
  echo "# Installing dein for vim package management"
  mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim;
  git clone https://github.com/Shougo/dein.vim.git \
    ~/.vim/dein/repos/github.com/Shougo/dein.vim;
fi

#vim script が配置してあれば実行
if test -e ~/.vimrc; then
  echo "# Insatlling vim plugins"
  vim +":dein#install()" +:q
fi

