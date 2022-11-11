"Php configuration file
echo "Loading Php config .... "

let g:phpactorPhpBin = "/usr/local/bin/php/"
let g:php_cs_fixer_verbose = 1

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

