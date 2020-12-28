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

" status/tabline
Plugin 'vim-airline/vim-airline'

" gui/terminal theme
Plugin 'morhetz/gruvbox'

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

" for rust
Plugin 'rust-lang/rust.vim'

" for python
Plugin 'psf/black'
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



"**** key mappings ****
" ctrl + h -> search visual block
vnoremap <C-h> y:/<C-r><C-r>"<CR>
" cancel search highlight (shouldn't map to esc, if problem, delete this)
nnoremap ,<esc> :nohlsearch<CR>



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



"**** gruvbox setup and settings ****
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox



"**** youCompleteMe settings ****
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"*** ale settings ***
