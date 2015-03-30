"pathogen
execute pathogen#infect()

colorscheme badwolf       
syntax enable           " enable syntax processing

"set ruler
"set cmdheight=2

set laststatus=2
hi statusline ctermfg=Green

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


set tabstop=4       " number spaces 
set softtabstop=4   " number of spaces in edit mode
set expandtab       " change tab to spaces

set showcmd             " show command in bottom bar

"set cursorline          " highlight current line


filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu

set lazyredraw          " redraw only when we neededed, better performance on macro's 
set showmatch           " highlight matching 

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR>

set foldenable          " enable folding

" highlight last inserted text
nnoremap gV `[v`]

" gundo key map
nnoremap <F5> :GundoToggle<CR>

" #################################
" allows cursor change in tmux mode
" #################################
"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif
"###################################



"################################################
"# status line config
"################################################
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

function! WindowNumber()
            let str=tabpagewinnr(tabpagenr())
                return str
endfunction


au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=Green guifg=Green ctermbg=15


" status line fomrating 
set statusline=%r%{getcwd()}%h/
set statusline+=%f                           " file name
set statusline+=\ %=                        " align left

set statusline+=\| 
set statusline+=\ %{&ff}   "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r\ \|\       "read only flag

set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n\                     " Buffer number
set statusline+=W:%{WindowNumber()}

