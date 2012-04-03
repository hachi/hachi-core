:sy on
:set softtabstop=4
:set expandtab
:set list
:set lcs=tab:**,trail:-
:set modeline
:set diffopt+=iwhite
:set incsearch

" I seem to hate mouse mode, because it ruins xterm so I can't do select and
" extend of text areas.
":set mouse=a
":set ttymouse=xterm2

set winminheight=0
:nmap <C-J> <C-W>j<C-W>_
:nmap <C-K> <C-W>k<C-W>_
:imap <C-J> <C-o>:wincmd j<CR><C-o>:wincmd _<CR>
:imap <C-K> <C-o>:wincmd k<CR><C-o>:wincmd _<CR>

:nmap <F5> :set paste<CR>
:nmap <F6> :set nopaste<CR>

autocmd BufEnter * let &titlestring = "vim(" . expand("%:t") . ")"

if &term == "screen"
    set t_ts=k
    set t_fs=\
    set title
endif

" Some perl syntax sets from vim have m!$! highlight as though $! was a
" variable (instead of being the end of string and closing the regex)
" newer ones seem to do this right though.
"unlet perl_extended_vars
