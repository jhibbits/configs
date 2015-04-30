version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set cscopeprg=/usr/bin/cscope
set cscopetag
set cscopeverbose
set formatoptions=tcql
set history=50
set ruler
set viminfo='20,\"50
set suffixesadd=.e
set number
" vim: set ft=vim :
syntax on
set ts=3
set sw=3
set sta
set sts=3
set sr
set si
set et
set ai
set textwidth=0
set wrapmargin=0
set smartcase
set showcmd
set splitright
colors elflord
" Map esc to jk
inoremap jk <esc>
inoremap <esc> <nop>
" turn off search highlight
nnoremap <esc> :noh<return><esc> 
filetype indent on      " load filetype-specific indent files
set wildmenu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldmethod=marker   " fold based on indent level
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" easily open ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" easily source ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" Remap leader from '\' to ','
let mapleader = ","
let g:mapleader = ","

" ,w: open a new vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Return to last edit position when opening files (You want this!)
augroup BRP
   autocmd!
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup end
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
nnoremap <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
nnoremap <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%-.20f%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h%=Line:\ %l/%L\ \ \ Col:\ %c

"""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

""""""""""""""""""""""""""""""""
" => Abbreviations
""""""""""""""""""""""""""""""""
augroup SpecAbbrs
   autocmd!
   autocmd FileType spec :iabbrev <sp0> LCore.pcie_sub_inst.pm88_60_433_sp0
   autocmd FileType spec :iabbrev <sp1> LCore.pcie_sub_inst.pm88_60_433_sp1
   autocmd FileType spec :iabbrev <sp2> LCore.pcie_sub_inst.pm88_60_433_sp2
   autocmd FileType spec :iabbrev <sp3> LCore.pcie_sub_inst.pm88_60_433_sp3
   autocmd FileType spec :iabbrev <sp4> LCore.pcie_sub_inst.pm88_60_433_sp4
   autocmd FileType spec :iabbrev <sp5> LCore.pcie_sub_inst.pm88_60_433_sp5
   autocmd FileType spec :iabbrev <sara_top> LCore.saratoga_top_inst.lw42_60_08_core_dftw_inst.lw42_60_08_core_inst.
augroup end
