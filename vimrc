set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'critiqjo/lldb.nvim'
Plug 'joshdick/onedark.vim'
Plug 'jpetrie/vim-counterpoint'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'L9'
Plug 'marciomazza/vim-brogrammer-theme'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'moll/vim-bbye'
Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'shime/vim-livedown'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/taglist.vim'
Plug 'wellle/targets.vim'
call plug#end()            " required

filetype plugin indent on    " required
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
    let &guifont="mononoki 10"
endif

" Remap leader to Space
let mapleader = ","

" Visual bell instead of sounds
set visualbell

" Hide toolbar
set guioptions=-M

" Line numbering
set number

" Tabwidth 4
set ts=4 sw=4 sts=4 ai smartindent
" Use spaces instead of tabs
set expandtab
set smarttab
" Tabwidth 2 for JavaScript
autocmd FileType javascript setlocal ts=2 sw=2 sts=2
autocmd FileType javascript.jsx setlocal ts=2 sw=2 sts=2

" C indentation options
" g0 = public/private not indented
" (0 = line up inside unclosed parentheses
" J1 = JavaScript object declarations indented properly
" j1 = Java anonymous classes indented properly
" l1 = align {} after case according to the case label
" U1 = do not ignore (0 when ( is the first nonwhite char on the line.
" Ws = do not follow (0 when the opening ( is the last nonwhite char on the
"      line.
set cino=g0,(0,J1,j1,l1,U1,Ws


" Split behavior
set splitbelow
set splitright

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\|\t\+$/

" Set highlight color for taglist.vim
highlight TagListTagName ctermfg=LightYellow guifg=LightYellow

" Set column indicator at 80 and 110 columns
let &colorcolumn = "80"
highlight ColorColumn ctermbg=236 guibg=#2c2d27

" Use extended regular expressions
set magic

" Use secure encryption
set cryptmethod=blowfish2

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
nnoremap <C-tab>   :bnext<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left>  :bprevious<CR>
nnoremap <C-S-tab> :bprevious<CR>
inoremap <C-tab>   <Esc>:bnext<CR>i
inoremap <C-S-tab> <Esc>:bprevious<CR>i
nnoremap <F3>      /<CR>
inoremap <F3>      <Esc>/<CR>i

" Keymaps for Neovim
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    command! -bang Fish terminal<bang> /usr/bin/fish
endif

" Map :W to :w
command! W w

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
let g:counterpoint_exclude_patterns = [".*\.o$", ".*\.d$", ".*\.gcda$"]

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

" Configure Ack to use the_silver_searcher
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!

let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND='ag -g ""'
nnoremap <C-P> :Files<CR>
inoremap <C-P> <Esc>:Files<CR>

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

