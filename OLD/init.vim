set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

"Plug 'chriskempson/base16-vim'
Plug 'markabe/bufexplorer'
Plug 'edsono/vim-matchit'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'othree/html5.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'flazz/vim-colorschemes'

" Elixir Plugins
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" Ruby Plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-cucumber'

" JavaScript Plugins
Plug 'walm/jshint.vim', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }

" Clojure Plugins
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'eapache/rainbow_parentheses.vim'

" CoffeeScript... sigh
Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'mustache/vim-mustache-handlebars'
Plug 'blarghmatey/split-expander'
Plug 'rking/ag.vim'
Plug 'sjl/vitality.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'geekjuice/vim-spec'
Plug 'tpope/vim-bundler'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/tComment'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'skwp/greplace.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-haml'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-rails'
Plug 'altercation/vim-colors-solarized'
Plug 'myusuf3/numbers.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jgdavey/tslime.vim'
Plug 'henrik/vim-qargs'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'jsx/jsx.vim'
Plug 'terryma/vim-expand-region'
Plug 'jpo/vim-railscasts-theme'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-cucumber'
Plug 'nelstrom/vim-visual-star-search'
Plug 'ConradIrwin/vim-bracketed-paste'
call plug#end()

filetype plugin indent on

let mapleader=","

" Other basic settings

set nocompatible               " Use Vim settings, not Vi
set ruler                      " show cursor position all of the time
set showcmd                    " display incomplete commands
set spell
set nowrap
set smarttab
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=eol,start,indent " backspacing over everything in insert mode
set hlsearch                   " highlight search terms
set incsearch                  " show search mates as you type
set ignorecase                 " ignore case when searching, but...
set smartcase                  " only when I'm using all lowercase search terms
set number
set cursorline
set nobackup
set noswapfile
set clipboard+=unnamedplus     " Always interact with the clipboard
set laststatus=2               " For Airline

let g:airline_powerline_fonts = 1

set t_Co=256
"let base16colorspace=256
set background=dark
"colorscheme monokai

syntax on

" Disable ex mode
map Q <Nop>

" Always use UNIX format
set fileformats=unix,dos

" Remove extra whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nnoremap <silent> <F6> :call <SID>StripTrailingWhitespaces()<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

command! -nargs=* Wrap set wrap linebreak nolist

set showbreak=…

" Clear search buffer
nmap <silent> <leader>/ :let @/=""<CR>

" Find and replace text under cursor
" http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" NERDTree conveniences
map <F2> :NERDTreeToggle<CR>
nnoremap <leader>nb :NERDTreeFromBookmark<Space>

" JSHint
nnoremap <leader>js :JSHint<CR>

" Tab completion
set wildmode=list:longest,list:full
set complete=.,w,t

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Treat Thor files like Ruby
au BufRead,BufNewFile {Capfile,Thorfile,Guardfile,*.thor,*.rabl,*.ru} set ft=ruby

" Additional auto complete keywords
set iskeyword+=-

" Mustache/Handlebars abbreviations
let g:mustache_abbreviations = 1

if has("autocmd")
  au  BufNewFile,BufRead *.{mustache,handlebars,hbs,hogan,hulk,hjs}{,.erb} set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
endif

" Folds
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space opens/closes folds
nnoremap <space> za

" Git conveniences
map <leader>g :Git<Space>

" Rainbows
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" FZF shit
"
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
