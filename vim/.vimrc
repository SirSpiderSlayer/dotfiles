" vim-plug section
call plug#begin('~/.vim/plugged')

	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" nerdtree and friends
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" eye candy baby
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Git wrapper
	" Plug 'tpope/vim-fugitive'

	" automatically close pairs of quotes, parenths, whatever
	Plug 'jiangmiao/auto-pairs'

	" rainbow brackets
	Plug 'luochen1990/rainbow'

	" Themes
	Plug 'christophermca/meta5'
	" Plug 'atahabaki/archman-vim'
	Plug 'embark-theme/vim', { 'as': 'embark' }
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'Shadorain/shadotheme'
	Plug 'fenetikm/falcon'
	Plug 'itchyny/landscape.vim'

	" Syntax highlighting for kitty config files
	Plug 'fladson/vim-kitty'

	" always load this last!
	" Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

let g:bufferline_echo = 0

" flash screen instead of bell
"set visualbell
set belloff=all

" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 11

" open new splits to the right
set splitright

" activate go-vim plugin according to this article
filetype plugin indent on
" run goimports on every save
let g:go_fmt_command = "goimports" 
" automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1
" enable go term for :GoRun output
let g:go_term_enabled = 1
" show output of :GoRun in new vsplit
let g:go_term_mode = "vsplit"

" turn off compatibility mode
set nocp
syntax on
" hybrid line numbers
set number relativenumber
set tabstop=4
set softtabstop=0 noexpandtab
set autoindent
" set smartindent
set smarttab


" Using Ctrl-j and Ctrl-j to scroll a quarter of a page
" insert mode
inoremap <expr> <C-j> '<ESC>'.winheight(0)/4.'<C-D>a'
inoremap <expr> <C-k> '<ESC>'.winheight(0)/4.'<C-U>a'

" visual mode
vnoremap <expr> <C-j> winheight(0)/4.'<C-D>'
vnoremap <expr> <C-k> winheight(0)/4.'<C-U>'

" normal mode
nnoremap <expr> <C-j> winheight(0)/4.'<C-D>'
nnoremap <expr> <C-k> winheight(0)/4.'<C-U>'

" look into this from my mac's vimrc:
" colorscheme slate

set shiftwidth=4
" creates ~/.cache/vim dir for swap files, if it doesn't exist
" from: https://stackoverflow.com/a/43880028
" note: use $HOME, not ~
if !isdirectory($HOME . "/.cache/vim")
	call mkdir($HOME . "/.cache/vim", "p", 0700)
endif

set encoding=utf-8

" https://www.shortcutfoo.comblog/top-50-vim-configuration-options/
set dir=~/.cache/vim
" ignore case while searching
set ignorecase
" incremental search shows partial matches
set incsearch
" avoid wrapping a line in the middle of a word
set linebreak
" always show cursor position
set ruler
" increase undo limit (default is 20)
set history=1000

" set for vim-airline theme
set t_Co=256
" for tokyonight
set termguicolors
"set background=dark
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1

colorscheme tokyonight " meta5


"colorscheme meta5
" set airline theme
let g:airline_theme="tokyonight" "'badwolf'
" needed for airline + devicons
let g:airline_power_fonts = 1
" gets rid of the white space symbol which was adding weird chars to the end
" of the file
" let g:airline#extensions#whitespace#symbol = '!'
" let g:airline#extensions#whitespace#enabled = 0
set ambiwidth=double
" show autocomplete prompt for go files by pressing .
" from here: https://unix.stackexchange.com/questions/22781/how-to-recover-a-shell-after-a-disconnection/22784
au filetype go inoremap <buffer> . .<C-x><C-o>

" Ctrl-n to toggle nerd tree
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" activate rainbow brackets
let g:rainbow_active = 1
au BufNewFile,BufRead Jenkinsfile setf groovy
