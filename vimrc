" $Author: tpolesch $
" $Date: 2013/03/05 05:47:30 +0100 $
" $Revision: 21 $
" $Source: /vimrc $
" $Snapshot: /misc/tpolesch/MiscFiles/Current $
"
" Description: config file for gvim and vim
" ---------------------------------------------

" differentiate between vim and gvim
if has("gui_running") 
    set lines=50 columns=140 
    set guifont=Monospace\ 11
    " set guifont=DejaVu\ Sans\ Mono\ Book\ 11
    set guioptions+=m   " turn on menu
    set guioptions-=T   " turn on toolbar
    set guioptions-=L   " left scrollbar is present when there is a vertical split window
    set guioptions+=r   " right scrollbar is always present
    highlight Normal guibg=lightyellow
endif

" global settings
set modeline        " allow file specific settings. see :help modeline
set number          " show line numbers
set incsearch       " incremental searching
set hlsearch        " highlight all search results
set nowrapscan      " search does not wrap around the end of the file
set tabstop=4       " default is 4
set shiftwidth=4    " default is 4
set expandtab       " insert spaces instead of tabs
set cinoptions+=g0  " set public/private/protected indent to 0
set cinoptions+=:0  " set 'case' indent to 0
syntax on           " switches on syntax highlighting with default color settings
filetype on         " enable file type detection
filetype indent on  " enable loading the indent file for specific file types
autocmd FileType c set cindent
autocmd FileType cpp set cindent

let $UTILITYTREE='CurrentWork'
let $NLSREV='CurrentWork'
set path=./../INCLUDE\ /home/m5/sw/utility/$UTILITYTREE/include\ /home/m5/sw/nls/$NLSREV/include
set tags=tags\ /home/tpolesch/CODE/tags.tree
set wrap            " continue too long lines on next line
set showmatch       " show matching bracket when typing a new one
set textwidth=0     " no automatic line breaks in insert mode

" code snippet extension
iab for_ for (unsigned int index = 0; index < count; ++index)<CR>{<CR>}<CR><ESC>?index<CR>

" function definitions
function RecursiveGrep( arg1 )
    let txt = a:arg1
    if( txt != "" )
        cclose
        silent exec 'vimgrep '.txt.' **/*.h **/*.cpp **/*.c **/*.desc **/*.raw **/*.opid **/*.epas **/Makefile **/*.mk'
        cw
    else
        echo 'RecursiveGrep: empty string passed'
    endif
endfunction

" modified keyboard mappings.
" recall complete list with :map
" play last macro recorded with ESC qa ... Esc q
nnoremap <S-F1> @a <CR>

" show buffers and select one by entering its number
nnoremap <F2> :buffers<CR>:buffer<Space>

" grep for word under cursor in current subdirectories
nnoremap <F3> :call RecursiveGrep( expand("<cword>")) <CR>

" prompt for a string to grep for in current subdirectories
nnoremap <F4> :call RecursiveGrep( input("RecursiveGrep: ")) <CR>

" source-code-control commands
" needs tkdiff [sudo apt-get install tkcvs]
nnoremap <F5> :execute "!wll %"<CR>
nnoremap <F6> :execute "silent !wdiff -Ptkdiff %"<CR>
nnoremap <F7> :execute "!wco -l -tNoComment %"<CR>
nnoremap <S-F7> :execute "!wco -fl -tNoComment %"<CR>
nnoremap <F8> :execute "!wci -u %"<CR>

" build (non-)parallel for different products, show error window
nnoremap <F9> :make -j PRODUCT=DELPHI<CR>
nnoremap <S-F9> :make PRODUCT=DELPHI <CR>

nnoremap <F10> :make -j PRODUCT=ANTARES<CR> :cw<CR>
nnoremap <S-F10> :make PRODUCT=ANTARES <CR> :cw<CR>

nnoremap <F11> :make -j PRODUCT=MP5<CR> :cw<CR>
nnoremap <S-F11> :make PRODUCT=MP5 <CR> :cw<CR>

" recursive tags in current directory
" needs ctags [sudo apt-get install exuberant-ctags]
map <S-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" put lines with search results in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Shift+Space triggers completion
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>
" F12 triggers syntax check of current file
map <F12> :call g:ClangUpdateQuickFix()<CR>
imap <F12> <ESC>:call g:ClangUpdateQuickFix()<CR>a

" clang_complete options
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=0
let g:clang_trailing_placeholder=1
let g:clang_close_preview=0
let g:clang_user_options='-m32 -fpack-struct=2 -DGNUC_SUPPRESS_ATOMIC_WARNING -isystem /home/m5/sw/utility/CurrentWork/include -isystem /home/m5/sw/nls/CurrentWork/include'
let g:clang_complete_macros=1
let g:clang_complete_patterns=1
let g:clang_use_library=1 " libclang 3.0-6ubuntu3 crashes too often
let g:clang_library_path="/home/tpolesch/INSTALL/clang+llvm-3.2-x86_64-linux-ubuntu-12.04/lib/"


