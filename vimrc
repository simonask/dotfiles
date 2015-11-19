set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/NERDTree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'rking/ag.vim'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colors brogrammer

let g:airline_powerline_fonts = 1

" Show tabline even if only buffers (no tabs) are open
let g:airline#extensions#tabline#enabled = 1

" Powerline-capable font for gVim
let &guifont="Inconsolata-g for Powerline 10"

" Hide toolbar
set guioptions-=T

" Line numbering
set number

" Tabwidth 4
set ts=4 sw=4 sts=4 ai smartindent

" Natural keymaps for buffers
nnoremap <C-T>     :enew<CR>
nnoremap <C-N>     :!gvim &<CR><CR>
nnoremap <C-tab>   :bnext<CR>
nnoremap <C-S-tab> :bprevious<CR>
inoremap <C-tab>   <Esc>:bnext<CR>i
inoremap <C-S-tab> <Esc>:bprevious<CR>i
inoremap <C-T>     <Esc>:enew<CR>

" Don't ask to confirm loading of .ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0

" Allow modified buffers to be hidden
set hidden

" Use the nearest .git dir as the cwd for CtrlP
let g:ctrlp_working_path_mode = 'r'
