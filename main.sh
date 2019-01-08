#!/bin/bash
. ./bin/script.sh

if [ "$(uname)" == "Darwin" ]; then
    brew install python3 2> /dev/null;
    brew install cmake 2> /dev/null;
    brew install vim 2> /dev/null;

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get update
    sudo apt-get install -y cmake && sudo apt-get -y upgrade
    sudo apt-get -y install python3-pip
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
fi

git submodule update --init --recursive

## install plugin

vundleSite="git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
vimNerdcommenterSite="git clone https://github.com/scrooloose/nerdcommenter ~/.vim/bundle/nerdcommenter"
vimGruvboxSite="git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox"
vimCtrlpSite="git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp.vim"
YouCompleteMeSite="git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe ;
    cd ~/.vim/bundle/YouCompleteMe ;
    python install.py --all"

bundleCheck "Vundle.vim" "$vundleSite" &
bundleCheck "nerdcommenter" "$vimNerdcommenterSite" &
bundleCheck "dracula-theme" "$vimGruvboxSite" &
bundleCheck "ctrlp.vim" "$vimCtrlpSite" &
bundleCheck "YouCompleteMe" "$YouCompleteMeSite" &


## vimrc setting
. ./vimSet/editVimrc.sh

## pyenv & virtualenv
if [ "$(uname)" == "Darwin" ]; then
    brew install pyenv
    brew install pyenv-virtualenv

    PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    exec $SHELL
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
    exec "$SHELL"
fi
