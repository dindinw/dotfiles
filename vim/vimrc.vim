"The pathogen.vim , Manage your 'runtimepath' with ease.
"Install
"   mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"   curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"
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

"using a completed command menu at the botton of screen"
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

" YCM code complete 
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
" Plugin 'thinca/vim-quickrun'
" My forked QuickRun
Plugin 'dindinw/vim-quickrun'

" vimproc, need to compile before use 
Plugin 'Shougo/vimproc.vim'

" go vim plugin
Plugin 'fatih/vim-go' 
noremap ,gb :GoBuild<CR>
noremap ,gr :GoRun<CR>
noremap ,gi :GoInstall<CR>
noremap ,gt :GoTest<CR>
noremap ,gd :GoDoc<CR>

" vim-test plugin
Plugin 'janko-m/vim-test'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" get file full path
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
nnoremap ,ct :CommandT<CR>
nnoremap ,cb :CommandTBuffer<CR>
nnoremap ,cj :CommandTJump<CR>
"                                                     Most Recently Used (MRU) files 
nnoremap ,cm :CommandTMRU<CR> 
"                                                     use Esc to quit
let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
"                                                     map UP/DOWN for next/prev
let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']

" Ctrl-P
nnoremap ,p :CtrlP<CR>

" 120 width verical line
set cc=120
hi ColorColumn ctermbg=23

" QuickRun
nnoremap ,r  :QuickRun <CR>
nnoremap ,ra :QuickRun -args ""<LEFT>
nnoremap ,R  :<UP>
nnoremap ,r1 :QuickRun -outputter quickfix:into=1<CR>
nnoremap ,r2 :QuickRun -outputter loclist:into=1<CR>
let g:quickrun_config = {
\   "_" : {
\      "runner" : "vimproc",
\      "runner/vimproc/updatetime" : 10,
\      "outputter" : "message"
\   },
\}
let g:quickrun_no_default_key_mappings = 1


" Make it easy to navigate quickfix errors (and helpgrep)...
"
nmap <silent> <DOWN>   :cnext<CR>
nmap <silent> <UP>     :cprev<CR>
nmap <silent> <RIGHT>  :cnf<CR>
nmap <silent> <LEFT>   :cpf<CR>

" Fix A B C D mess up with arrow keys, might relate to Command-T
"
map <Esc>[B <Down>

" Quick edit and reload the ~/.vimrc 
"
noremap ;v  :tabnew $MYVIMRC<CR> 
noremap ;vv :source $MYVIMRC<CR>

" Quick reload current file changes from disk
"
noremap ;r  :edit!<CR>

" Open an new tab for help
"
augroup HelpInTabs
	autocmd!
	autocmd BufEnter *.txt call HelpInNewTab()
augroup END
function! HelpInNewTab ()
	if &buftype == 'help'
		execute "normal \<C-W>T"
	endif
endfunction

" Move around
" hljk ,  0^$ , -<CR> , { } , gg, G , <N>gg <N>G, <P>% eg: 50%
" % can jump between {} () [] , see :help matchpair
" w b W B

" Using backspace to delete in insert mode
" see :helpg :set backspace
set backspace=indent,eol,start

" Tabular
" if exists(":Tabularize")
    nmap ;g :Tabularize /
" endif

" In insert mode, you also can copy
" CTRL-Y  : copy previous line (keep typing it, it will copy lettles one by one)
" CTRL-E  : copy following line
" CTRL-A  : insert again the most recent inserted
" CTRL-R= : insert a expession evaluation.

" CTRL-T  : insert tab
" CTRL-D  : remove tab , so that the pair can work as line ag
" CTRL-V  : insert control character. C-VI -> ^I -> tab
" CTRL-O  : go to normal mode for one command than back to insert mode

" Searching
" need to add extra backslash, ex:
"   \d\+      foo\|bar
" or use \v as prefix to omit extra backslash,ex:
"   \v\d+    \vfoo|bar
" you can remap / to /\v so that save extra backslashes
" nnoremap / /\v
" |  : or
" &  : and
" \< : begin of word
" /> : end of word
" *  : seach next current word on the cursor
" #  : seach provious current word on the cursor

" using delete key in normal mode to cancel the hight search result
nmap <silent> <BS> :nohlsearch<CR>

"
" Yank matches, very useful, learn from Damian Conway, coyied from
" https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/yankmatches.vim
"
nmap <silent> dm  :     call ForAllMatches('delete', {})<CR>
nmap <silent> DM  :     call ForAllMatches('delete', {'inverse':1})<CR>
nmap <silent> ym  :     call ForAllMatches('yank',   {})<CR>
nmap <silent> YM  :     call ForAllMatches('yank',   {'inverse':1})<CR>
vmap <silent> dm  :<C-U>call ForAllMatches('delete', {'visual':1})<CR>
vmap <silent> DM  :<C-U>call ForAllMatches('delete', {'visual':1, 'inverse':1})<CR>
vmap <silent> ym  :<C-U>call ForAllMatches('yank',   {'visual':1})<CR>
vmap <silent> YM  :<C-U>call ForAllMatches('yank',   {'visual':1, 'inverse':1})<CR>

function! ForAllMatches (command, options)
    " Remember where we parked...
    let orig_pos = getpos('.')

    " Work out the implied range of lines to consider...
    let in_visual = get(a:options, 'visual', 0)
    let start_line = in_visual ? getpos("'<'")[1] : 1
    let end_line   = in_visual ? getpos("'>'")[1] : line('$')

    " Are we inverting the selection???
    let inverted = get(a:options, 'inverse', 0)

    " Are we modifying the buffer???
    let deleting = a:command == 'delete'

    " Honour smartcase (which :lvimgrep doesn't, by default)
    let sensitive = &ignorecase && &smartcase && @/ =~ '\u' ? '\C' : ''

    " Identify the lines to be operated on...
    exec 'silent lvimgrep /' . sensitive . @/ . '/j %'
    let matched_line_nums
    \ = reverse(filter(map(getloclist(0), 'v:val.lnum'), 'start_line <= v:val && v:val <= end_line'))

    " Invert the list of lines, if requested...
    if inverted
        let inverted_line_nums = range(start_line, end_line)
        for line_num in matched_line_nums
            call remove(inverted_line_nums, line_num-1)
        endfor
        let matched_line_nums = reverse(inverted_line_nums)
    endif

    " Filter the original lines...
    let yanked = ""
    for line_num in matched_line_nums
        " Remember yanks or deletions...
        let yanked = getline(line_num) . "\n" . yanked

        " Delete buffer lines if necessary...
        if deleting
            exec line_num . 'delete'
        endif
    endfor

    " Make yanked lines available for putting...
    let @" = yanked
    " Make sure the system clipboard also yanked, required if set clipboard+=unnamed
    let @+ = yanked

    " Return to original position...
    call setpos('.', orig_pos)

    " Report results...
    redraw
    let match_count = len(matched_line_nums)
    if match_count == 0
        unsilent echo 'Nothing to ' . a:command . ' (no matches found)'
    elseif deleting
        unsilent echo match_count . (match_count > 1 ? ' fewer lines' : ' less line')
    else
        unsilent echo match_count . ' line' . (match_count > 1 ? 's' : '') . ' yanked'
    endif
endfunction

"
" Range
" .   : means current cursor line
" $   : means the last line
" .,$ : means each line of the rest of file
" 99: : short-cut for input :.,+98
" %   : short-cut for 1,$ (entire file)
"
" Repalce
" &   : do replace again, short-cut for :s<CR>
"
" globle range ':g'
" ex1  :  'g /^\s/ :center'
" ex2  :  'g /<foo>/ :normal gUU'
" Note :  'g' also used as a command for toggle case
"      :  gU gu g~ gUgU(gUU) gugu(guu)
"
" When separated with ';' the cursor position will be set to that line
" before interpreting the next line specifier.  This doesn't happen for ','.
" Examples 
"    -5,+5
" 	from the cursor line. up 5 line and after 5 line, so that 10 lines range
"    -5;+5
"   from the cursor line, up 5 line then down 5 line, so that 5 lines range
" ':g /./ :.;/^$/join' : join every paragraph.
" ':g /./ :.;/^$/-1join' : for every line, try to do command, from the current
" cursor line(.) to next space line (^$), then go back -1 line(so that excluded 
" the space line), then join those range.    
" 

"
" Yank
"
" y$  : yank to end of line
" yw  : yank to end of word
" yW  : yank to end of work (pad determined)
" yaw : yank a word
" yaW : yank a word (pad determined)
" yas : yank a sentence
" yap : yank a pragraph
" ya{ : yank a {...}
" ya[ : yank a [...]
" ya( : yank a (...)
" ya< : yank a <...>
" ya" : yank a \"..."
" ya' : yank a '...'
" ya` : yank a `...`
"

"
" Undo beyond u 
"
" g- 		Go to older text state. 
" :earlier {count}	Go to older text state {count} times.
" :earlier {N}s		Go to older text state about {N} seconds before.
" :earlier {N}m		Go to older text state about {N} minutes before.
" :earlier {N}h		Go to older text state about {N} hours before.
" :earlier {N}d		Go to older text state about {N} days before.
" g+		Go to newer text state.
" :later {count}	Go to newer text state {count} times.
" :later {N}s		Go to newer text state about {N} seconds later.
" :later {N}m		Go to newer text state about {N} minutes later.
" :later {N}h		Go to newer text state about {N} hours later.
" :later {N}d		Go to newer text state about {N} days later.
"

"
" Command History 
"
" q: 	 open cmd history window
" q/     open seach history window
"

"
" command complete
"
" % 	means current file path
" write to a back file of the current file
" :w[rite] %.bak
"
" # 	means latest edited file name
" :r[ead] #
" 	:r[ead] {file_name} 	insert content of file below the cursor.
"							if no file_name provided, means current file.	
" 	:r[ead] !{cmd}			insert output of cmd below the cursor.	
"
" **	means match any number of *, */*, */*/* 
" open any filename.txt below you current directory
" next **/filename.txt  
"

"
" text complete (insert mode, see ':help ins-completion')
" 
" ctrl-x ctrl-f	complete file names
"
" ctrl-x ctrl-d	complete defined identifiers
" 	which controled by 'define' setting.
" 	'set define=^\s*#\s*define',the default value is for c programs.
" 	for c++ this value may like ^\(#\s*define\|[a-z]*\s*const\s*[a-z]*\)
" 
" ctrl-x ctrl-n	next completion
" 	complete 'keyword'character from the current file (or files in the
" 	session).
"					ctrl-x ctrl-p	previous completion
" 					ctrl-x ctrl-i	complete identifiers
" 
" ctrl-x ctrl-o	omni completion
"   see the difference between omnifunc and completefunc, :help 'omnifunc' 
" 

" 
" visually 
"   v		(visual mode)
"   v		(visual line mode)
"   <c-v>	(visual block mode)
" you can alawys switch bwteen the modes from another. 
"
" vip 	visual select a paragraph
" vipJ	then join all lines
"
" gv	reslect the same block you selected

" Folding
"  zf		fold
"  zd		delete fold
 
