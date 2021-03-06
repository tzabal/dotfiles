"
" Vim Feature: The Basics
"

" Ensure that Vim will behave in a more useful way
set nocompatible

" Required for pathogen plugin to work
execute pathogen#infect()

" Enable the 'expected' functionality of backspace
" Allow backspacing over everything in Insert mode
set backspace=indent,eol,start

" Disable the audible bell (beeping) and the visual bell (flashing)
autocmd GUIEnter * set vb t_vb=

" Precede each line with its line number
set number

" Highlight the current line of the cursor
set cursorline

" Show the line and column number of the cursor position
set ruler

" Do not wrap lines when they are longer than the width of the window
set nowrap

" Enable syntax highlighting (sources /usr/local/share/vim/vim74/syntax/syntax.vim)
syntax enable

" Enable file type detection, loading of plugin files for specific file types, loading of indent files for specific file types
filetype plugin indent on

" Disable the arrow keys for navigation (in all modes)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>


"
" Vim Feature: Windows
"

" Just for reference
" e {file} : open {file} in a new buffer
" <C-w>s : split current window horizontally, same buffer in both windows
" <C-w>v : split current window vertically, same buffer in both windows
" :sp[lit] {file} : split current window horizontally, first window - original buffer, second window - {file} buffer
" :vsp[lit] {file} : split current window vertically, first window - original buffer, second window- {file} buffer

" Mappings for using Ctrl+hjkl to move around windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Mapping for using Ctrl+c to close the active window
noremap <C-c> <C-w>c

" Mapping for using Ctrl+Arrows to increase/decrease the width and height of the current window
noremap <C-Right> <C-w>>
noremap <C-Left> <C-w><
noremap <C-Up> <C-w>+
noremap <C-Down> <C-w>-


"
" Plugin: Solarized
"

" Set as color scheme the dark background mode of Solarized
set background=dark
colorscheme solarized


"
" Plugin: MiniBufExplorer
"

" Mapping for toggling the MBE window
map <Leader>m :MBEToggle<CR>

" Let MBE start as soon as one normal buffer is available (default is 2)
let g:miniBufExplBuffersNeeded = 1


"
" Plugin: NERD tree
"

" Mapping for toggling the NERDTree window
noremap <Leader>n :NERDTreeToggle<CR>


" Mapping for opening the NERDTree window (used for focus)
noremap <Leader>no :NERDTree<CR>


"
" Plugin: Taglist
"

" Mapping for toggling the Taglist window
noremap <Leader>t :TlistToggle<CR>

" Mapping for opening the Taglist window (used for focus)
noremap <Leader>to :TlistOpen<CR>

" Open the Taglist window on the right hand side
let Tlist_Use_Right_Window = 1


"
" Plugin: Pydiction
"

" Set the absolute path of the 'complete-dict' file (required)
" let g:pydiction_location = '/home/tzabal/.vim/bundle/pydiction/complete-dict'


"
" Plugin: vim-json
"

" Disable concealing of double quotes
let g:vim_json_syntax_conceal = 0


"
" Plugin: conque
"

" Mapping for tranforming the current window to bash shell
noremap <Leader>ct :ConqueTerm bash<CR>

" Mapping for opening a new windows that has a bash shell
noremap <Leader>cts :ConqueTermSplit bash<CR>


"
" Vim Feature: Specific settings based on the detected FileType
"

" FileType: Python
autocmd FileType python setlocal expandtab softtabstop=4 shiftwidth=4 tabstop=8 foldmethod=indent foldlevel=99
let g:syntastic_python_checkers=['flake8']

" FileType: Shell 
autocmd FileType sh setlocal expandtab softtabstop=2 shiftwidth=2

" FileType: make
autocmd FileType make setlocal noexpandtab tabstop=8 softtabstop=8 shiftwidth=8

" FileType: Git Commit Message
autocmd FileType gitcommit setlocal spell textwidth=72

" FileType: HTML
autocmd FileType html setlocal expandtab softtabstop=2 shiftwidth=2
let g:syntastic_html_checkers=['']
"let g:syntastic_html_validator_api=['http://validator.nu/']

" FileType: JSON
autocmd FileType json setlocal expandtab softtabstop=4 shiftwidth=4 foldmethod=syntax

" FileType: Mako
autocmd FileType mako setlocal expandtab softtabstop=4 shiftwidth=4 tabstop=8

" FileType: JavaScript
autocmd FileType javascript setlocal expandtab softtabstop=2 shiftwidth=2


"
" Vim Feature: Hacks
"

" Close buffer without losing the splitted window
noremap <Leader>c :bp\|bd #<CR>

" Delete any trailing whitespaces from the end of each line
noremap <Leader>dw :%s/\s\+$//<CR>

" Auto format an opened JSON file
noremap <Leader>json :%!python -m json.tool<CR>
