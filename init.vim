filetype plugin indent on
syntax on

set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
" set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set smartindent
set cindent
set tabstop=4 shiftwidth=4 expandtab
" set gdefault            " Use 'g' flag by default with :s/foo/bar/.
" set magic               " Use 'magic' patterns (extended regular expressions).
set number
set relativenumber

" Stuff
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
"if &listchars ==# 'eol:$'
   "set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  "set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
"endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
" Filesystem Viewer
Plug 'scrooloose/nerdtree'
" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'
" A cool status bar
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'
" Nord
Plug 'arcticicestudio/nord-vim'
" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'
" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Terminal Split Support
Plug 'vimlab/split-term.vim'
" Fuzzy filesystem finder, Needs RipGrep and fzy installed
Plug 'cloudhead/neovim-fuzzy'
" Colorscheme
Plug 'tomasiser/vim-code-dark'
" Auto-close braces and scopes
" Plug 'jiangmiao/auto-pairs'
" Scala Imports and Docs
" Plug 'derekwyatt/vim-scala'
call plug#end()

let g:coc_global_extensions = [
      \ 'coc-pyright',
      \ 'coc-prettier',
      \ 'coc-pairs',
      \ 'coc-metals',
      \ 'coc-yaml',
      \ 'coc-json',
      \ 'coc-docker'
      \ ]

" NERDTree Configs
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" KeyMappings for navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move KeyMappings
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
"inoremap <S-j> <Esc>:m .+1<CR>==gi
"inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" KeyMappings for adding newlines
nnoremap <S-Enter> <Esc>o
nnoremap <C-Enter> <Esc>O
inoremap <S-Enter> <Esc>o
inoremap <C-Enter> <Esc>O

" Completion KeyMappings
inoremap <expr> <Enter> pumvisible() ? "\<C-y>" : "\<ENTER>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" NerdCommenter Mapping
" nnoremap <C-/> <Plug>NerdCommenterInvert
" inoremap <C-/> <Plug>NerdCommenterToggle

" FuzzyFinder
nnoremap <C-space> :FuzzyOpen<CR>

" Airline Settings
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1

" Color Configs
" colorscheme nord
hi Pmenu ctermbg=green ctermfg=black
hi PmenuSel ctermbg=cyan ctermfg=black
colorscheme codedark

" coc-prettier config
" Mainly for use with javascript files
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Scala IDE Configs
autocmd FileType json syntax match Comment +\/\/.\+$+
" coc.nvim configs
" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" METALS Configs
" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

" Use <c-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()
"endif

nmap <silent> J <Plug>(coc-definition)
nmap <silent> JJ :vsp<CR><Plug>(coc-definition)
nmap <silent> H <Plug>(coc-references)
nmap <silent> HH :vsp<CR><Plug>(coc-references)
nmap <silent> L <Plug>(coc-implementation)
nmap <silent> LL :vsp<CR><Plug>(coc-implementation)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
