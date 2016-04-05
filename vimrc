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
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'jpetrie/vim-counterpoint'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'joshdick/airline-onedark.vim'
Plugin 'terryma/vim-multiple-cursors'

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

colors onedark

let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

" Show tabline even if only buffers (no tabs) are open
let g:airline#extensions#tabline#enabled = 1

" Powerline-capable font for gVim
if has("gui_macvim")
    set guifont=Inconsolata-g\ for\ Powerline:h12
elseif has("gui_running")
    " gVim
    let &guifont="Inconsolata-g for Powerline 10"
endif

" Remap leader to Space
let mapleader = "\<Space>"

" Hide toolbar
set guioptions-=T

" Line numbering
set number

" Tabwidth 4
set ts=4 sw=4 sts=4 ai smartindent
" Use tabs instead of spaces
set expandtab
set smarttab

" Split behavior
set splitbelow
set splitright

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\|\t/

" Use extended regular expressions
set magic

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif

" Starting from vim 7.3 undo can be persisted across sessions
" http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2onmqe
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Natural keymaps for buffers
nnoremap <C-T>     :enew<CR>
nnoremap <C-tab>   :bnext<CR>
nnoremap <C-S-tab> :bprevious<CR>
inoremap <C-tab>   <Esc>:bnext<CR>i
inoremap <C-S-tab> <Esc>:bprevious<CR>i
inoremap <C-T>     <Esc>:enew<CR>
nnoremap <F3>      /<CR>
inoremap <F3>      <Esc>/<CR>i

" Keymaps for GoTo
nnoremap <C-K>     :vs<CR>:YcmCompleter GoToDefinition<CR>
nnoremap <C-J>     :YcmCompleter GoTo<CR>
nnoremap <C-D>     :YcmCompleter GetDoc<CR>
inoremap <C-K>     <Esc>:vs<CR>:YcmCompleter GoToDefinition<CR>i
inoremap <C-J>     <Esc>:YcmCompleter GoTo<CR>i
inoremap <C-D>     <Esc>:YcmCompleter GetDoc<CR>i

" Keymaps for Counterpoint
nnoremap <C-A>     :CounterpointNext!<CR>
inoremap <C-A>     <Esc>:CounterpointNext!<CR>
let g:counterpoint_exclude_patterns = [".*\.o$", ".*\.d$"]

" Don't ask to confirm loading of .ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0

" Objective-C support for YCM
let g:ycm_semantic_triggers = {
 \ 'objc' : ['re!\@"\.*"\s',
 \ 're!\@\w+\.*\w*\s',
 \ 're!\@\(\w+\.*\w*\)\s',
 \ 're!\@\(\s*',
 \ 're!\@\[.*\]\s',
 \ 're!\@\[\s*',
 \ 're!\@\{.*\}\s',
 \ 're!\@\{\s*',
 \ '#ifdef ',
 \ 're!:\s*',
 \ 're!=\s*',
 \ 're!,\s*', ],
 \ }

" Triple-/ comments in C/C++
autocmd Filetype c,cpp set comments^=:///

" Allow modified buffers to be hidden
set hidden

" Use the nearest .git dir as the cwd for CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\vCMakeFiles',
    \ 'file': '\v(CMakeCache\.txt|CTestTestfile\.cmake|cmake_install\.cmake)',
\ }

" gist-vim settings
let g:gist_post_private = 1
let g:gist_show_privates = 1
let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
    let g:gist_clip_command = 'pbcopy'
elseif os == "Linux"
    let g:gist_clip_command = 'xclip -selection clipboard'
endif

" Markdown support
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['cpp', 'c', 'objc', 'js=javascript', 'json=javascript']

