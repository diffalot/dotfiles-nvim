"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" The Person I copied this config from wants you to remember:
" "Make sure you use single quotes!"
"
" Compiled from an ancient `.vimrc` that had collected a lot of other people's
" configurations and the example on the front page of the CoC git repo.
" https://github.com/neoclide/coc.nvim
"
" Going forward I will not be testing this init.vim on anything but nvim.
" 
" Alice Davis <alice@gigantic.computer>
" Monday, May 3, 2021
"
" todo:
" [ ] Figure out why home/end are broken :(
" [ ] Make yank and put in nvim syncronize with tmux
" [ ] Make gq aware of code so it doesn't break things as often ??? I'm sure
" many have tried https://vim.fandom.com/wiki/Automatic_formatting_of_paragraphs
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8

set mouse=a

set splitbelow
set splitright

set ignorecase
set smartcase

set nohlsearch

set number &

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I don't know what anthing in this section means, I just copied it from
" https://github.com/neoclide/coc.nvim along with the CoC configuration at the
" end of the file.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expensive Things for a Text Editor to be Carrying Around in this Neighborhood
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Git Everything in Order
Plug 'tpope/vim-fugitive'

" Langage Server Client, Linting and Formatting Automation
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Individual langages are configured farther down in this file in the 
" "CoC Language Settings" section

" Like Git, but for undo history
Plug 'mbbill/undotree'
nmap <F2> :UndotreeToggle<CR>

" Open URLs under the Cursor with macOS `open`
Plug 'henrik/vim-open-url'
nmap <F3> :OpenURL<CR>

" NERDTree for directory browsing
Plug 'scrooloose/nerdtree'
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>ntf :NERDTreeFocus<CR>
nnoremap <Leader>ntr :NERDTreeRefreshRoot<CR>
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plug 'preservim/tagbar'
" brew install ctags-exuberant
" npm install -g git+https://github.com/ramitos/jsctags.git
" more at https://github.com/preservim/tagbar/wiki
nmap <F9> :TagbarToggle<CR>

Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
"
" if I understand the the instructions:
" brew install --HEAD universal-ctags/universal-ctags/universal-ctags
" that will reqire replacing ctags-exuberant
" then you have to go into the plugged foder and compile these two???
"
" Commands - https://github.com/xolox/vim-easytags#commands
"
" `:UpdateTags` updates tags starting from the active buffer and to `:UpdateTags
" <args>` is essentially running `ctags <args>`
" `:UpdateTags!` prunes the global list of tags that realate to files that are
" no longer present
" `:HighlightTags` highlights all tags known to easytags in the current buffer
" and runs continually when you are afk and not typing are run atomatically
" (when `g:easytags_on_cursorhold` is false)
" 
" tag files are stored at `~/.vim/tags`
"
" The following options may be uncommented to reduce easytag's veracity in
" consuming all computer resources
" e.g. don't process python files
" autocmd FileType python let b:easytags_auto_highlight = 0`
" let g:easytags_syntax_keyword = 'always'
"
" Languages have been added farther down in this file in the 
" "Universal CTags Language Settings" section

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tools to help formatting text for readability
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Text Editing Superpowers
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'

" :setlocal textwidth=80
" :setl tw=80
set tw=80
set colorcolumn=80

" Quick controls over word wrap
"set showbreak=â€¦
set wrap linebreak nolist
command! -nargs=* WrapOn set wrap linebreak nolist
command! -nargs=* WrapOff set wrap! linebreak! nolist!

" Spell Checking
" todo(alice): figure out how this works.  I can't get it to do anything
" Step through necessary
" Correct all words in buffer.      ZL
" Correct word under cursor.        Zl 

" todo(alice): Figure out how this works, track this bug and respond, etc
" https://github.com/kamykn/spelunker.vim/issues/60
set nospell
Plug 'kamykn/popup-menu.nvim'
Plug 'kamykn/spelunker.vim'
let g:enable_spelunker_vim = 1
" Spellcheck type: (default: 1)
" 1: File is checked for spelling mistakes when opening and saving. This
" may take a bit of time on large files.
" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
" depends on the setting of CursorHold `set updatetime=1000`.
let g:spelunker_check_type = 1
" Disable URI checking. (default: 0)
let g:spelunker_disable_uri_checking = 1
" Disable email-like words checking. (default: 0)
let g:spelunker_disable_email_checking = 1
" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking = 1
" Disable acronym checking. (default: 0)
let g:spelunker_disable_acronym_checking = 1
" Disable checking words in backtick/backquote. (default: 0)
let g:spelunker_disable_backquoted_checking = 1
" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 1
" Override highlight setting.
highlight SpelunkerSpellBad cterm=bold ctermfg=Green
"gui=underline guifg=#9e9e9e
"highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'vim-scripts/SyntaxComplete'

" Polyglot to so at least everything is highlighted
Plug 'sheerun/vim-polyglot'

" Apparently these are now the recommended JavaScript plugins, according to
" https://github.com/MaxMEllon/vim-jsx-pretty , and now that I've seen them in
" action, I have to concu 
Plug 'yuezk/vim-js'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'

Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs =
      \ 'jquery,react,underscore,jasmine,chai,handlebars,vue,d3,tape'

Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'elzr/vim-json'
Plug 'jxnblk/vim-mdx-js'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Python
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

" Documentation
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

" Aspirational and Things that I Might actually use or learn
Plug 'rust-lang/rust.vim'
Plug 'elixir-editors/vim-elixir'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Things that Make Life Better
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'dikiaap/minimalist'
Plug 'jonathanfilip/vim-lucius'
Plug 'Lokaltog/vim-distinguished'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" todo(alice): fork this project and only add some of the themes, it's just
" too many
"Plug 'chriskempson/base16-vim'

" Git modifications noted in the gutter
Plug 'airblade/vim-gitgutter'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_statusline_ontop=0
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
"let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
"let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
"let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
"let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
"let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
"let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
"let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
"let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
"let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                                              
"let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Just Computer Programs Being Pals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" A little help from tmux to know when vim is focused or not
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-obsession'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()      " Now the plugin system will initialize
                     " so things like colorschemes can be set.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme Declaration (they were activated by plug earlier)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=* IsThisNvim call ReallyIsNvim()
function ReallyIsNvim()
  if has("nvim")
    echo 'This is nvim.'
  else
    echo 'This is not nvim.'
  endif
endfunction

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

" Quick controls over dark and light backgrounds
" toggle dark and light modes
function! Lightswitch()
  if (&background == 'dark')
    :call GoLight()
  else
    :call GoDark()
  endif
endfunction

command! -nargs=* LightsOn call GoLight()
command! -nargs=* LightsOff call GoDark()

function GoLight()
  set background=light
  let g:background='light'
  let g:airline_theme='papercolor'
  colorscheme PaperColor
  "colorscheme lucius
  "LuciusLightHighContrast
  let g:material_terminal_italics = 1
  let g:material_theme_style = 'lighter'
  colorscheme material
  "colorscheme minimalist
  "colorscheme distinguished
endfunction

function GoDark()
  set background=dark
  let g:background='dark'
  let g:airline_theme='distinguished'
  "colorscheme PaperColor
  colorscheme lucius
  "LuciusBlack
  LuciusDark
  "LuciusDarkHighContrast
  "colorscheme minimalist
  "colorscheme distinguished
endfunction

" set the background by the time of day
if strftime("%H") < 19 && strftime("%H") > 5
  call GoLight()
else
  call GoDark()
endif

"" Base 16 Shell integration
"if filereadable(expand("~/.vimrc_background"))
"    let base16colorspace=256
"    source ~/.vimrc_background
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Universal CTags Language Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

let g:tagbar_type_json = {
    \ 'ctagstype' : 'json',
    \ 'kinds' : [
      \ 'o:objects',
      \ 'a:arrays',
      \ 'n:numbers',
      \ 's:strings',
      \ 'b:booleans',
      \ 'z:nulls'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
    \ 'object': 'o',
      \ 'array': 'a',
      \ 'number': 'n',
      \ 'string': 's',
      \ 'boolean': 'b',
      \ 'null': 'z'
    \ },
    \ 'kind2scope': {
    \ 'o': 'object',
      \ 'a': 'array',
      \ 'n': 'number',
      \ 's': 'string',
      \ 'b': 'boolean',
      \ 'z': 'null'
    \ },
    \ 'sort' : 0
    \ }

let g:tagbar_type_markdown = {
  \ 'ctagstype'	: 'markdown',
  \ 'kinds'		: [
    \ 'c:chapter:0:1',
    \ 's:section:0:1',
    \ 'S:subsection:0:1',
    \ 't:subsubsection:0:1',
    \ 'T:l4subsection:0:1',
    \ 'u:l5subsection:0:1',
  \ ],
  \ 'sro'			: '""',
  \ 'kind2scope'	: {
    \ 'c' : 'chapter',
    \ 's' : 'section',
    \ 'S' : 'subsection',
    \ 't' : 'subsubsection',
    \ 'T' : 'l4subsection',
  \ },
  \ 'scope2kind'	: {
    \ 'chapter' : 'c',
    \ 'section' : 's',
    \ 'subsection' : 'S',
    \ 'subsubsection' : 't',
    \ 'l4subsection' : 'T',
  \ },
\ }

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Language Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_node_path='/usr/local/bin/node'

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver',
      \ 'coc-html', 'coc-css', 'coc-prettier', 'coc-pyright', 'coc-deno',
      \ 'coc-markdownlint', 'coc-solargraph', 'coc-rust-analyzer', 'coc-vetur',
      \ 'coc-vimlsp']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                ¯\_(ツ)_/¯
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
