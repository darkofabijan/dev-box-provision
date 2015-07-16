#!/bin/bash -eux

rm -rf dot .vim .vimrc .oh-my-zsh

ssh-keyscan github.com >> ~/.ssh/known_hosts

git clone git@github.com:darkofabijan/dot.git dot
cd dot
./install.sh
cd

git clone git@github.com:darkofabijan/vim-web-dev.git .vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc

sudo apt-get install -y zsh
sudo chsh -s $(which zsh) vagrant

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" || echo "ok"
