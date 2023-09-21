call plug#begin()

	Plug  'frazrepo/vim-rainbow'
	Plug  'Heliferepo/VimTek'
	Plug  'Heliferepo/VimUtils'
	Plug  'neoclide/coc.nvim', {'branch':'release'}
	Plug  'f-person/git-blame.nvim'
	Plug  'mbbill/undotree'
	Plug  'junegunn/fzf', {'do': { -> fzf#install() } }
	Plug  'endel/vim-github-colorscheme'
	Plug  'jacoborus/tender.vim'
	Plug  'preservim/nerdtree'

call plug#end()

let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nmap <silent> gd :vsplit<CR><Plug>(coc-definition)

nnoremap <leader>u :UndotreeToggle<CR><bar>:wincmd h<CR>

nnoremap <C-f> :FZF<CR>
set wildignore+=*.a,*.o,*.so,*.pyc,.git
set wildignore+=*.tmp,*.swp

autocmd VimEnter * NERDTree | wincmd p

colorscheme tender

abbrev retrun return
set nobackup
set noswapfile
set number
set rnu
set nowrap
set clipboard+=unnamedplus
