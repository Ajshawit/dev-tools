"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"BASIC CONFIGURATION									"	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible "stops vi compatibility
syntax on "highlight syntax
set number "show line numbers
set noswapfile "disable the swapfile
set hlsearch "highlight all results
set ignorecase "ignore case in search
set incsearch "show search results as you type
set path+=** "Provide tab-completion for all file-related tasks
set wildmenu "Display all matching files when we tab complete
set tabstop=4 "Make tabs 4 spaces
set shiftwidth=4 "When shifting, indent using four spaces
set expandtab "tabs convert to spaces
set nowrap "Disable line wrapping
set scrolloff=6 "The number of screen lines to keep above and below the cursor.
set noshowmode "removes 'mode' indicator as lightline does this for us
set notimeout ttimeout "make vim time out for key codes but not mappings
set backspace=indent,eol,start "make backspace work as 'normal'
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"KEY CONFIGURATION										"	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Makes Ctrl+C work like Esc
nnoremap <C-c> <Esc>
 
"Map leader to space
let mapleader = " "

"Open fzf search
map <leader>f :Files ~/<CR> 

"Open nerd tree
map <leader>t :NERDTreeToggle %<CR>

"Split view
map <leader>vs :vs<CR>
map <leader>sp :sp<CR>

"Window navigation
map <leader>h <C-W>h<C-W>_<CR> 
map <leader>l <C-W>l<C-W>_<CR>
map <leader>k <C-W>k<C-W>_<CR>
map <leader>j <C-W>j<C-W>_<CR>
map <leader>n <C-W>j<C-W>_<CR>
map <leader>x <C-W>j<C-W>_<CR>

"Normal Stuff
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>qqq :q!<CR>

"Reload vimrc
map <leader>rrr :source ~/.vimrc<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tweaks for browsing with netrw 						"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner=0 "disables annoying banner
let g:netrw_browse_slipt=4 "open in prior window
let g:netrw_altv=1 "open splits to right
let g:netrw_liststyle=3 "tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins 												"	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
    
    "One half theme
    Plug 'sonph/onehalf', { 'rtp': 'vim' }

	" Emmet
	Plug 'mattn/emmet-vim'

	" NerdTree
	Plug 'preservim/nerdtree'

	" fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}	
    Plug 'junegunn/fzf.vim'
    
	" lightline 
	Plug 'itchyny/lightline.vim'

	" vim-fugitive
	Plug 'tpope/vim-fugitive'
	
	" vim-gitgutter
	Plug 'airblade/vim-gitgutter'

    " youcompleteme - need to install additional components: https://vimawesome.com/plugin/youcompleteme
	Plug 'valloric/youcompleteme'

    " vim-javascript 
	Plug 'pangloss/vim-javascript'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme and UI options								    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Enables true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256
colorscheme onehalfdark  

"Remove background of vim, line numbers and sign column 
hi Normal guibg=NONE ctermbg=NONE 
"highlight clear SignColumn
"highlight clear LineNr


"Ruler customisations
set cursorline "turn on highlighting current line
hi CursorLine ctermbg=235 ctermfg=NONE guibg=#313640 
hi CursorLineNr ctermbg=235 gui=bold guifg=#e5c07b guibg=#313640


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands and advanced options     				"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set number relativenumber "Enables relative line numbers

"https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber "Relative numbers turn off for inactive windows or insert mode
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber "Relative numbers turn on for active windows in normal mode
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Customisation									"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" lightline 

let g:lightline = {
	\'colorscheme': 'onehalfdark',
	\'active': {
	\	'left': [
	\				[ 'mode', 'paste' ],
	\				['fugitive', 'filename', 'modified']
	\			],
	\	'right':[
	\				[ 'lineinfo' ],
	\				[ 'percent' ],
	\				[ 'fileformat', 'fileencoding', 'filetype' ] 
	\			]
	\},
	\'component': {
	\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
	\   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
	\},
	\'component_visible_condition': {
	\	'readonly': '(&filetype!="help"&& &readonly)',
	\	'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
	\	'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
	\},
	\'component_function': {
	\	'filename': 'LightlineFilename',	
	\	'mode': 'LightlineMode'
	\},
	\}

"This function shows the path, not just the file name
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"This function adds the plugin name into the mode component 
function! LightlineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

set laststatus=2 "lightline won't show without this
