execute pathogen#infect()

"The ft plugin, :set ft=python for a file type."
filetype plugin on

"The filetype plugin's indent on, so indent is according to filetype"
"for example : "
"autocmd FileType html setlocal shiftwidth=2 tabstop=2"
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2"
filetype plugin indent on

"always show statusline
set laststatus=2
"user powerline font 
let g:airline_powerline_fonts = 1

"show line numbers"
set nu

"show a ruler for cursor postion at right-hand bottom screen for ROW,COL"
set ru

"open file color syntax"
syntax on

"set background=light
"colorscheme solarized
"let g:solarized_termcolors=256

"color scheme"
"colorscheme ir_black

" All Tabs (8)
"Tabs are eight columns wide. Each indentation level is one tab. 
"Popular with the Linux kernel.
"set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

" All Tabs (4)
"Tabs are four columns wide. Each indentation level is one tab. 
"Popular with Windows developers using Visual Studio.)
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" All Space (4)
"Each indentation level is four spaces. Tabs are not used. 
"Popular with Java programmers
"set softtabstop=4 shiftwidth=4 expandtab

"set auto indent"
set autoindent

set foldlevel=0

"show in list mode: speciall chars for example end character"
"set list

"set for paste mode, so that a copy/paste don't mess up
"    Don't use set paste directly. only need that set when you actually paste text in terminal Vim 
"    It's best to bind this to a key. 
set pastetoggle=<F10>

"using incremental search mode"
set incsearch hlsearch

"highlight search"
set hlsearch

"using a compeleted command menu at the botton of screen"
set wildmenu

"set to access system clipboard"
set clipboard+=unnamed

"set autoindent

au BufNewFile,BufRead *.gradle setf groovy

" need to install vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'

" Aligning assignments
Plugin 'godlygeek/tabular'

" Markdown
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1 " disable the folding


" Session
Plugin 'tpope/vim-obsession'

" tree, bar, fizzy ...  
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wincent/command-t'

" Tags 
" vim-easytags not work for me smoothly
" Plugin 'xolox/vim-misc'      "vim-easytags required
" Plugin 'xolox/vim-easytags'

" YCM code compelete 
Plugin 'Valloric/YouCompleteMe'

" Code Snippet
"
" Snipmate snipmate not work perfectly with YCM
"Plugin 'MarcWeber/vim-addon-mw-utils' "snipmate required 
"Plugin 'tomtom/tlib_vim'              "snipmate required 
"Plugin 'garbas/vim-snipmate'
" UltiSnips
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsJumpForwardTrigger = "<Right>"
let g:UltiSnipsJumpBackwardTrigger = "<Left>"

" QuickRun 
Plugin 'thinca/vim-quickrun'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" get file pull path
noremap ,cp :let @+=expand("%:p:h")<CR>
noremap ,cl :let @+=expand("%:p")<CR>

" tab title
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':%') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!Tabline()

" NERDTreeTabs 
let g:NERDTreeWinSize=50
nnoremap ,1 :NERDTreeTabsToggle<CR>
nnoremap ,n :NERDTreeTabsFind<CR>
nnoremap ,nf :NERDTreeTabsFind<CR> <C-w>l <Space>
nnoremap tn :tabnew<Space>
nnoremap ts :tabs<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprev<CR>
nnoremap <C-h> <C-w>h <Space> 
nnoremap <C-l> <C-w>l <Space>

" tagbar
nnoremap ,8 :TagbarToggle<CR>

" tags
"      use crtl-[ for ctrl-t, Jump back from the definition
nnoremap <C-[> <C-T> 

" YMC
let g:EclimCompletionMethod = 'omnifunc'
"                                                     YMC menu color 
highlight Pmenu ctermfg=10 ctermbg=23

" Command-t  
nnoremap ,t :CommandT<CR>
nnoremap ,b :CommandTBuffer<CR>
nnoremap ,j :CommandTJump<CR>
"                                                     Most Recently Used (MRU) files 
nnoremap ,m :CommandTMRU<CR> 
"                                                     use Esc to quit
let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
"                                                     map UP/DOWN for next/prev
let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']

" Ctrl-P
nnoremap ,p :CtrlP<CR>

" 120 ruler
set cc=120
hi ColorColumn ctermbg=23

" QuickRun
nnoremap ,R :QuickRun<CR>
nnoremap ,r :QuickRun<CR>
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}
let g:quickrun_no_default_key_mappings = 1

