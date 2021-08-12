lua << EOF
require('core.options')
require('plugins')
require('lsp')
require('keybinds')
EOF

" /-------------
" | Keymappings |
" --------------/

" Completion
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
 
colorscheme monokai_pro

