" --------------------------------------------------------------------------
" vim settings
" --------------------------------------------------------------------------
syntax on
set history=700
set exrc                    " forces vim to sourc .vimrc file if present
set secure                  " set secure when using excr
set number
set autoindent
set smartindent
set nowrap
set cindent
set updatetime=250
set tabstop=4
set softtabstop=3
set shiftwidth=4
set noexpandtab
" set colorcolumn=110
set autoread

set mousehide
if has('mouse')
    set mouse=a
endif


" --------------------------------------------------------------------------
" colorscheme settings
" --------------------------------------------------------------------------
set t_Co=256
set term=screen-256color
colorscheme maui


" --------------------------------------------------------------------------
" leader
" --------------------------------------------------------------------------
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"


" --------------------------------------------------------------------------
" pathogen - plugin manager
" --------------------------------------------------------------------------
execute pathogen#infect()
filetype plugin on
filetype indent on

" --------------------------------------------------------------------------
" nerdtree open on startup
" --------------------------------------------------------------------------
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


" --------------------------------------------------------------------------
" toggle operations
" --------------------------------------------------------------------------
map <leader>d :NERDTreeToggle<CR>
map <leader>n :set number<CR>
map <leader>N :set nonumber<CR>


" --------------------------------------------------------------------------
" git-gutter settings
" https://github.com/airblade/vim-gitgutter
" --------------------------------------------------------------------------
" let g:gitgutter_diff_args = '-w'
" let g:gitgutter_map_keys = 0
" let g:gitgutter_escape_grep = 1
let g:gitgutter_enabled = 1
" let g:gitgutter_signs = 0
" let g:gitgutter_highlight_lines = 1
let g:gitgutter_signs = 1
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 0


" --------------------------------------------------------------------------
" syntastic settings
" --------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" --------------------------------------------------------------------------
" ressources
" --------------------------------------------------------------------------
" - https://github.com/asenchi/vim/blob/master/vimrc

