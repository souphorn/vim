let mapleader=","
syntax on
"colorscheme evening
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
nmap <leader>ta :!phpunit --bootstrap=tests/bootstrap.php --configuration=tests/phpunit.xml tests<cr>
nmap <leader>tw :w<cr>
nmap <leader>tq :bd<cr>
nmap <leader>w <C-w>
nmap <leader>ts :tselect<cr>

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
set number        " always show line numbers
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
    if ex == 0
        :!phpunit --configuration=tests/phpunit.xml %
    else
        :!phpunit --bootstrap=tests/bootstrap.php --configuration=tests/phpunit.xml %
    endif
endfunction
