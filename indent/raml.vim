" indentation settings for RAML files

if exists('b:did_indent')
    finish
endif

setlocal autoindent

setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

let b:did_indent = 1

let b:undo_indent = "setlocal tabstop< autoindent<".
            \ " shiftwidth< expandtab<"


