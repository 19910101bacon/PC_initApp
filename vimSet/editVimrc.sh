#!/bin/bash
cat <<EOF >~/.vimrc
set nocompatible

filetype off " required   https://codeday.me/bug/20180422/156689.html
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'

let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1
set completeopt-=preview

call vundle#end()            " required
filetype plugin indent on



set history=1000
set autoindent
set shiftwidth=4
set tabstop=4
set ruler
syntax on
set showmatch "( )
set incsearch "search while typing
set ic "search ignoring capitalization
set scrolloff=3 "automatically reserve three lines
set cursorline  "highlight current line
set number

color gruvbox

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
