"**** Vundle ****
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" file tree
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" status/tabline
Plugin 'vim-airline/vim-airline'

" gui/terminal themes
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'

" file search
Plugin 'ctrlpvim/ctrlp.vim'

" git plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" autocomplete
" ycm needs extra setup:
" https://github.com/ycm-core/YouCompleteMe#linux-64-bit
Plugin 'ycm-core/YouCompleteMe'

" linter, code completer
Plugin 'dense-analysis/ale'

" ripgrep source code search plugin
" needs extra setup:
" https://github.com/BurntSushi/ripgrep#installation
Plugin 'jremmen/vim-ripgrep'

" for rust
Plugin 'rust-lang/rust.vim'

" for svelte
Plugin 'evanleck/vim-svelte'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable		     " in rust.vim readme
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal



"**** basic vim settings ****
set number
set signcolumn=yes
set bg=dark
"highlight search finds ( :noh to cancel)
set hlsearch
" cut/copy to global clipboard
set clipboard=unnamedplus
" open quickfix automatically when grepping?
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
" set ignore files when grepping
set wildignore+=./.venv/**



"**** key mappings ****
let mapleader = ' '
" cancel search highlight (shouldn't map to esc, if problem, delete this)
nnoremap <leader><esc> :nohlsearch<CR>
" search for highlighted text
vnoremap <leader>f "ay:/<C-r>a<CR>
" search for highlighted text in multiple files with ripgrep
vnoremap <leader>F "ay:Rg --vimgrep --type-not sql --smart-case "<C-r>a" . <CR>
" toggle quickfix window
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <leader>c :call ToggleQuickFix()<cr>

" Change selected text from NameLikeThis to name_like_this.
vnoremap ,u :s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul



"**** indentation by file type ****
" by default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype c setlocal ts=4 sw=4 sts=0 expandtab



"**** NERDTree settings ****
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>



"**** color schemes setup and settings ****
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
"colorscheme gruvbox
colorscheme PaperColor



"**** youCompleteMe settings ****
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F2> :YcmCompleter RefactorRename 

"*** ale settings ***
let g:ale_linters = {
\   'python': ['flake8', 'mypy', 'pyright', 'bandit'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
\   'python': ['black', 'isort'],
\		'javascript': ['eslint', 'prettier'],
\}
"let g:ale_fix_on_save = 1



"**** ctrlp settings ****
let g:ctrlp_show_hidden = 1
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']



"**** gitgutter settings ****
autocmd BufWritePost * GitGutter
