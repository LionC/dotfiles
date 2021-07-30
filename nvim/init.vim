lua << EOF
require('core.options')
require('plugins')
require('lsp')
-- require('keybinds')
EOF

" Keymappings

nnoremap <C-n> :NvimTreeToggle<CR>

nnoremap ; :
nnoremap gb <C-o>

" Finding things
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>

noremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

vnoremap <leader>c "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
vnoremap <leader>p "+p
vnoremap <leader>x "+d

nnoremap <silent> <Esc> :nohl<CR>

" Completion
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
 
colorscheme monokai_pro
highlight clear SignColumn

