call plug#begin()

Plug  'frazrepo/vim-rainbow'
Plug  'Heliferepo/VimTek'
Plug  'Heliferepo/VimUtils'
Plug  'neoclide/coc.nvim', {'branch':'release'}
Plug  'f-person/git-blame.nvim'
Plug  'mbbill/undotree'
Plug  'akinsho/nvim-toggleterm.lua'
Plug  'kyazdani42/nvim-tree.lua'
Plug  'junegunn/fzf', {'do': { -> fzf#install() } }
Plug  'endel/vim-github-colorscheme'
Plug 'jacoborus/tender.vim'

call plug#end()

set number
set rnu
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
let mapleader = " "

nnoremap <leader>u :UndotreeShow<CR><bar>:wincmd h<CR>

if has('persistent_undo')
       silent !mkdir ~/.vim/undodir > /dev/null 2>&1
       set undodir=$HOME/.vim/undodir
       set undolevels=5000
       set undofile
endif

set nobackup
set noswapfile

function! SetupCommandAbbrs(from, to)
       exec 'cnoreabbrev <expr> '.a:from
       			\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
       			\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

autocmd FileType json syntax match Comment +\/\/.\+$+
let g:coc_global_config="$HOME/.config/nvim/coc-settings.json"

call SetupCommandAbbrs('C', 'CocConfig')
function! s:check_back_space() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <Tab>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<Tab>" :
     \ coc#refresh()

set nowrap

set clipboard+=unnamedplus

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

let g:toggleterm_terminal_mapping = '<C-j>'
autocmd TermEnter term://*toggleterm#*
     \ tnoremap <silent><c-j> <C-\><C-n>:exe v:count1 . "ToggleTerm"<CR>

inoremap <silent><c-j> <Esc>:<c-u>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-j> <Esc>:<c-u>exe v:count1 . "ToggleTerm"<CR>

nnoremap <C-n> :NvimTreeToggle<CR>
"set termguicolors " this variable must be enabled for colors to be applied properly

nnoremap <C-f> :FZF<CR>
set wildignore+=*.a,*.o,*.so,*.pyc,.git
set wildignore+=*.tmp,*.swp

nmap <silent> gd :vsplit<CR><Plug>(coc-definition)

set list
set listchars=tab:··
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set incsearch

abbrev retrun return
