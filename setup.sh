#!/bin/bash

dest_path="$HOME/"

dotfiles=(
'.ackrc'
'.bash_aliases'
'.blazerc'
'.oh-my-zsh'
'.profile'
'.pyrc'
'.tmux-plugins'
'.tmux.conf'
'.vim'
'.vimrc'
'.vimrc.google'
'.vimrc.zzb'
'.xmonad'
'.zshrc'
'ctrlp.sh'
'date_delta.py')

for file in ${dotfiles[@]};
do
  ln -s $PWD'/'$file $dest_path$file
done

######################################
pkgs=('ack-grep')
for pkg in ${pkgs[@]}
do
  sudo apt-get install $pkg
done

# Install tmux 1.8
if [[ `tmux -V` != 'tmux 1.8' ]]
then
  sudo apt-get install libevent-dev libncurses-dev pkg-config
  wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.8/tmux-1.8.tar.gz 
  tar -xzvf tmux-1.8.tar.gz
  cd tmux-1.8
  ./configure
  make
  sudo make install
  cd ..
  rm -rf tmux-1.8*
else
  echo 'Tmux 1.8 already installed.'
fi

# Google only
if [[ -e '/google' ]]; then
  ineptitude install youcompleteme stable
fi
