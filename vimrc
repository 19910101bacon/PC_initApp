set nocompatible

filetype off " required   https://codeday.me/bug/20180422/156689.html
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on

let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1
set completeopt-=preview

set history=1000
set autoindent
set shiftwidth=4
set tabstop=4
set ruler
syntax on
set showmatch " ( )
set incsearch " search while typing
set ic " search ignoring capitalization
set scrolloff=3 " automatically reserve three lines
set cursorline " highlight current line
set number
