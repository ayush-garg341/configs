" Python specific configuration

echo "Loading Python Config ..... "

let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': [], 'python': ['black']}
let g:ale_fix_on_save = 1

let python_highlight_all=1

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

"autocmd BufWrite *.py call Autoflake()
nmap <Leader>f :call Autoflake()<CR>
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_remove_unused_variables=1
let g:autoflake_disable_show_diff=1
