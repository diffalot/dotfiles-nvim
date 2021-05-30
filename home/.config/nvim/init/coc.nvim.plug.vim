"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Keybindings
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

let g:coc_start_at_startup = 0

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Coc Snippets
" https://github.com/neoclide/coc-snippets
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Pairing
" coc-pairs
"
" In CocConfig
" pairs.disableLanguages, list of language ids to disable this extension, default: [].
" pairs.enableCharacters, list of enabled characters, default: ["(", "[", "{", "<", "'", "\"", "`"].
" pairs.enableBackspace, enable imap for backspace to remove paired characters, default: true, won't work when <bs> is already mapped.
"
" In Vim:
"
" autocmd FileType tex let b:coc_pairs = [["$", "$"]]
" autocmd FileType markdown let b:coc_pairs_disabled = ['`']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"    Language Server and Client Setup
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Recommended Plugins
"
" https://github.com/neoclide/coc-snippets
" https://github.com/rome/tools
" coc-rome
"
" https://github.com/neoclide/coc-sources
"
" Installed
"
" :CocInstall coc-pairs coc-snippets coc-json coc-yaml coc-sh \
"     coc-vimlsp coc-markdownlint coc-emoji coc-dictionary coc-tag
" :CocInstall coc-tsserver coc-html coc-css coc-cssmodules \
"     coc-html-css-support coc-prettier coc-stylelintplus \
"     coc-tailwindcss coc-sql coc-pyright
" :CocInstall coc-graphql coc-prisma coc-deno coc-rust-analyzer
" :CocInstall coc-github coc-git coc-yank coc-explorer coc-bookmark
"
"" Editor Enhancements
" coc-pairs
" coc-snippets
" coc-yank
" coc-gist
" coc-git
"
"" Basics
" coc-json
" coc-yaml
" coc-sh
" coc-vimlsp
" coc-markdownlint
"
"" Fun
" coc-emoji
" coc-translator
" coc-dictionary
"
"" Code Analysis
" coc-tag
"
"" Web Development
" coc-tsserver
" coc-html
" coc-css
" coc-cssmodules
" coc-html-css-support
"
""" Linters
" coc-prettier
" coc-eslint
" coc-stylelintplus
"
""" Frameworks
" coc-vetur
" coc-tailwindcss
"
""" Database
" coc-sql
" coc-graphql
" coc-prisma
"
"" Runtimes and
"" Programming Languages
" coc-rust-analyzer
" coc-deno
" coc-pyright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc Launguage Server Client
" build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', 
  \ {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Workspace configurations should be named coc-settings.json and be in the
" directory .vim. After a file is opened in vim, this directory is resolved
" from the parent directories of that file. Run the command :CocLocalConfig to
" open your workspace configuration file.

let g:coc_node_path = '/Users/alice/.nvm/versions/node/v14.16.1/bin/node'

" settings from https://github.com/neoclide/coc.nvim
set encoding=utf-8
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc Functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
