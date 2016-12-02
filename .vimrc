let mapleader=","
syntax on
colorscheme peachpuff
execute pathogen#infect()
nmap <F8> :TagbarToggle<CR>
nmap <leader>ff :FufFile<cr>
nmap <leader>fb :FufBuffer<cr>
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>ct :CommandT<cr>
nmap <leader>tl :Tlist<cr>
nmap <leader>/pd :call PhpDoc()<cr>
"nmap <leader>tt :!phpunit --bootstrap=tests/bootstrap.php %<cr>
nmap <leader>tt :call Souphorn()<cr>
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nmap <leader>ta :!./vendor/bin/phpunit --bootstrap=./tests/bootstrap.php --configuration=./tests/phpunit.xml tests<cr>
nmap <leader>tw :w<cr>
nmap <leader>tq :bd<cr>
nmap <leader>tb :% !xmllint --format -<cr>
nmap <leader>w <C-w>
nmap <leader>ts :tselect<cr>
nmap <leader>ft :set filetype=

nmap <leader>/gs :InsertBothGetterSetter<cr>

"Switch betwwen buffer without saving it
"
"Snippet 
let snips_author="An Souphorn <ansouphorn@gmail.com>"
set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
" allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
"set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

filetype plugin indent on
autocmd filetype python set expandtab

filetype plugin on
set expandtab

au BufRead *.php set ft=php.html
au BufNewFile *.php set ft=php.html

set tags=tags;/;ctags
function! Souphorn()
    let ex = file_readable("tests/bootstrap.php")
    let phpunitxmlExist = file_readable("tests/phpunit.xml")
    let phpunit = "--configuration=tests/phpunit.xml"
    if phpunitxmlExist == 0
        llet phpunit = ""
    endif
    if ex == 0
        :!./vendor/bin/phpunit phpunit %
    else
        :!./vendor/bin/phpunit --bootstrap=./tests/bootstrap.php phpunit %
    endif
endfunction
let b:did_phpgetset_ftplugin = 1

let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode."
let g:user_emmet_expandabbr_key='<c-e>'

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "setglobal bomb
    set fileencodings=ucs-bom,utf-8,latin1
endif
scriptencoding utf-8
set encoding=utf-8
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

:nnoremap <leader>g :lgrep -r --include="*.php" 
set guifont=ProggyCleanTT\ 12

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

set wildignore=vendor/**,node_modules/**
let g:airline#extensions#tabline#enabled = 1

au BufRead,BufNewFile *.ts   setfiletype typescript
set relativenumber
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256)

nnoremap \ :Ag<SPACE>
