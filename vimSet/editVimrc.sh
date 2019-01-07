#!/bin/bash
cat <<EOF >~/.vimrc

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

filetype plugin indent on

call vundle#end()
filetype plugin indent on

Plugin 'fcpg/vim-orbital'
colorscheme orbital
syntax on

Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1
set completeopt-=preview


set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set backspace=indent,eol,start

EOF

if [ "$(uname)" == "Darwin" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew cask install iterm2
    {
        brew install zsh zsh-completions
    } || {
        echo "Have installed ZSH"
    }
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="wezm"/g' ~/.zshrc
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get -y install zsh
    chsh -s /bin/zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="nebirhos"/g' ~/.zshrc
    sudo usermod -s /usr/bin/zsh $(whoami)
    # sudo reboot
fi
