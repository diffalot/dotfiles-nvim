"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alice Davis <alice@gigantic.computer>                             2021-05-09
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  The person I copied this config from wants you to remember:
"                                           'Make sure you use single quotes!'
" 
" Todo:
" [ ] Study how to test Vim Scripts
" [ ] get a solid fix for the tmux terminfo
" [ ] Find find something better than `gq` for reflowing text
"     :help formatoptions fo fo-table formatlistpat auto-format
"     https://vim.fandom.com/wiki/Automatic_formatting_of_paragraphs
"
" Done:
" [x] Make yank and put in nvim syncronize with tmux
" [x] Make tmux clipboard sync with macOS clipboard
" [x] Figure out why home/end are broken, but only sometimes 😨
"
" Compiled from an ancient `.vimrc` that had collected a lot of other people's
" configurations and the example on the front page of the CoC git repo.
" https://github.com/neoclide/coc.nvim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Things to Install
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux - vim - clipboard pasting
"
"   *Copying*
"
"   | System Type | Copy To           | How to Copy to It              |
"   | macOS       | the only one      | <apple> + <c>                  |
"   | vim         | vim yank? buffer  | (select text), <y>             |
"   | vim         | new tmux buffer   | sycronized with yank           |
"   | tmux        | new tmux buffer   | <bind-key>, [, (navigate to    |
"                                       beginning of desired           |
"                                       selection), <space>, (navigate |
"                                       to end of selection), <enter>  |
"   | tmux        | new tmux buffer   | select test with the mouse     |
" 
"
"   *Pasting*
"
"   | System      | Past From          | How to Paste from It          |
"   | tmux        | vim yank           | unknown (use paste from       |
"                                        newest buffer)                |
"   | tmux        | newest tmux buffer | <bind-key>, ]                 |
"   | tmux        | macOS              | depends on terminal, usually: |
"                                        <apple> + <c>                 |
"
"     ...To be continued
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The hopefully brief section of fixes
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To Debug the Configuration, turn things off and load up minivrc
"
" source ~/.config/nvim/vimrcs/minivimrc-romainl/vimrc
"
" https://github.com/romainl/minivimrc
"
" Running vim with out any plugins everynow and then is a nice reminder of how
" fast it can be `nvim -U NONE -u NONE`
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Distribution specific initialization
if has('win32')
elseif has('mac')
elseif has('unix')
  set shell=zsh
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" It's worth a nasty bug to have italics
set t_ZH=^[[3m
set t_ZR=^[[23m
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Based on Vim patch 7.4.1770 (`guicolors` option)
" https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
"
" Neovim > 0.1.5
" Vim > patch 7.4.1799 
"
" https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I've seen it worse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manage built in options

set nocompatible

set encoding=utf-8

filetype plugin on
syntax on

set mouse=a

set incsearch
set ignorecase
set smartcase
set nohlsearch

set number

set wrap
" set nolist

" todo:(alice) figure out good settings for markdown lists
set linebreak
set breakindent
set smartindent

" two spaces instead of tabs
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" but not always, here's to you, Python
autocmd FileType python set breakindentopt=shift:4

set textwidth=79
set colorcolumn=80

" Give more space for displaying messages.
set cmdheight=1

" Open new windows to the right and below
set splitbelow
set splitright

" let cursor move across line breaks
set whichwrap=b,s,<,>,[,]

" I don't like folding
set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu

if has("wildmenu")
  set wildmenu
  set wildmode=longest,list
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildignorecase
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Words

Plug 'henrik/vim-open-url'
" Trigger with <leader>u or :OpenURL

"Plug 'preservim/nerdcommenter'

" spelling
" keybindings: https://github.com/preservim/vim-lexical#spell-check
Plug 'preservim/vim-lexical'
let g:lexical#spell = 1
let g:lexical#spelllang = ['en_us','en_ca','en_gb']
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

Plug 'preservim/vim-wordy'
" https://github.com/preservim/vim-wordy

" Persistent Scratch
Plug 'mtth/scratch.vim'
let g:scratch_top = 1
let g:scratch_height = 18 
let g:scratch_filetype = 'markdown'
let g:scratch_persistence_file = '~/.scratch.md'
"let g:scratch_autohide = &hidden
"let g:scratch_insert_autohide = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File management

" Fugitive - https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'


" DiffView - https://github.com/sindrets/diffview.nvim
Plug 'sindrets/diffview.nvim'

" Signify - https://github.com/mhinz/vim-signify
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
set updatetime=100

" Git modifications noted in the gutter
" Plug 'airblade/vim-gitgutter'

" :grep
set grepprg=rg\ --vimgrep

" fuzzy finder
" brew install fsf ag ripgrep perl git-delta 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make the editor handle a lot of the thinking

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-endwise'

Plug 'mbbill/undotree'
" there's a lot of options for undotree so it is configures in
" ~/.config/nvim/plugins/conf.undotree.vim

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" if you have multiple checkers for a filetype
" let g:syntastic_<filetype>_checkers = ['<checker-name>']
" and you can run a checker or two on command

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting Megadeals Every SuperbGame Satuday!!!

" The fastest and most versitile, hopefully that'll take care of it
Plug 'sheerun/vim-polyglot'

Plug 'dag/vim-fish'
autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr

" Python
"Plug 'jmcantrell/vim-virtualenv'
"Plug 'vim-python/python-syntax'
"let g:python_highlight_all = 1

"Plug 'rust-lang/rust.vim'

" Allegedly the best, but I'm gonna try them out one at a time...
"Plug 'yuezk/vim-js'

" I'm not sure how fast this one is, I know it has Intellisense...
" Plug 'vim-scripts/SyntaxComplete'

" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
" let g:used_javascript_libs =
"       \ 'react,underscore,jasmine,chai,tape' 
        " jquery,handlebars,vue,d3,

" Allegedly the best, but I'm gonna try them out one at a time...
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'HerringtonDarkholme/yats.vim'

"Plug 'jxnblk/vim-mdx-js'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'elzr/vim-json'
"
"!"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"!" LSP Configs for built in LSC -  https://github.com/neovim/nvim-lspconfig
"!Plug 'neovim/nvim-lspconfig'
"!
"!command! -nargs=* StartLSPs call __StartLSPs()
"!function! __StartLSPs()
"!  LspStart tsserver
"!  LspStart vimls
"!endfunction
"!
"!lua << EOF
"!local lspconfig = require'lspconfig'
"!  lspconfig.tsserver.setup{}
"!  lspconfig.vimls.setup{}
"!EOF
"!
"!lua << EOF
"!local nvim_lsp = require('lspconfig')
"!local on_attach = function(client, bufnr)
"!  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"!  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
"!
"!  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
"!
"!  -- Mappings.
"!  local opts = { noremap=true, silent=true }
"!  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"!  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
"!  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"!  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"!  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"!  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
"!  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
"!  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
"!  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"!  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"!  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"!  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"!  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
"!  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
"!  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
"!  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
"!
"!  -- Set some keybinds conditional on server capabilities
"!  if client.resolved_capabilities.document_formatting then
"!    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
"!  end
"!  if client.resolved_capabilities.document_range_formatting then
"!    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
"!  end
"!
"!  -- Set autocommands conditional on server_capabilities
"!  if client.resolved_capabilities.document_highlight then
"!    vim.api.nvim_exec([[
"!      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
"!      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
"!      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
"!      augroup lsp_document_highlight
"!        autocmd! * <buffer>
"!        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
"!        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
"!      augroup END
"!    ]], false)
"!  end
"!end
"!
"!-- Use a loop to conveniently both setup defined servers 
"!-- and map buffer local keybindings when the language server attaches
"!local servers = { "pyright", "rust_analyzer", "tsserver" }
"!for _, lsp in ipairs(servers) do
"!  nvim_lsp[lsp].setup { on_attach = on_attach }
"!end
"!EOF
"!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings

set timeoutlen=1250
let mapleader='\'
let localmapleader = "\<Space>"

" Utilities
nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F9> :Vista!!<CR>
" (set by plugin) <leader> u OpenUrl

" File Management
nnoremap ,p :GFiles<CR>
nnoremap ,o :Files<CR>

" Tab Controls
nnoremap <C-k> :tabnew<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-m> :tabprevious<CR>
nnoremap <C-n> :tabmove<CR>
nnoremap <C-q> :tabclose<CR>

" Buffer Controls
nnoremap <C-b> :Buffers<CR>
nnoremap <C-v> :bd<CR>
nnoremap <M-l> :bn<CR>
nnoremap <M-m> :bp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP and Ctags Viewer - https://github.com/liuchengxu/vista.vim

Plug 'liuchengxu/vista.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EleLine - https://github.com/liuchengxu/eleline.vim

Plug 'liuchengxu/eleline.vim'
let g:eleline_powerline_fonts = 1
" let g:eleline_slim = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fancy Icons

Plug 'kyazdani42/nvim-web-devicons'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gutentags - https://github.com/ludovicchabant/vim-gutentags

Plug 'ludovicchabant/vim-gutentags'
set statusline+=%{gutentags#statusline()}
"Plug 'skywind3000/gutentags_plus'
"
"" enable gtags module
"let g:gutentags_modules = ['ctags'] ", 'gtags_cscope']
"
"" config project root markers.
"let g:gutentags_project_root = ['.root']
"
"" generate datebases in my cache directory, prevent gtags files polluting my project
"let g:gutentags_cache_dir = expand('~/.cache/tags')
"
"" change focus to quickfix window after search (optional).
"let g:gutentags_plus_switch = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A little help from tmux to know when vim is focused or not

Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes must be installed during plug initialization, but they can't be
" activated till after plug has loaded every single one, I think, maybe?

let g:lights_auto = 1

Plug 'preservim/vim-thematic'
let g:thematic#themes = {
\ 'bubblegum'  : {
\                },
\ 'jellybeans' : { 'laststatus': 0,
\                  'ruler': 1,
\                },
\ 'pencil_dark' :{'colorscheme': 'pencil',
\                 'background': 'dark',
\                 'airline-theme': 'badwolf',
\                 'ruler': 1,
\                },
\ 'pencil_lite' :{'colorscheme': 'pencil',
\                 'background': 'light',
\                 'airline-theme': 'light',
\                 'ruler': 1,
\                },
\ }

Plug 'preservim/vim-colors-pencil'
let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high
let g:pencil_neutral_headings = 0   " 0=blue (def), 1=normal
let g:pencil_neutral_code_bg = 0   " 0=gray (def), 1=normal
let g:pencil_gutter_color = 1      " 0=mono (def), 1=color
let g:pencil_spell_undercurl = 1       " 0=underline, 1=undercurl (def)
let g:pencil_terminal_italics = 1
"colorscheme pencil

Plug 'rakr/vim-one'
let g:one_allow_italics = 1
"" colorscheme one

Plug 'NLKNguyen/papercolor-theme'
" colorscheme PaperColor

Plug 'kaicataldo/material.vim', { 'branch': 'main' }
let g:material_terminal_italics = 1
let g:material_theme_style = 'lighter'
" colorscheme material

Plug 'ayu-theme/ayu-vim'
"let ayucolor="light"  
"let ayucolor="mirage" 
"let ayucolor="dark" 
"colorscheme ayu

"Plug 'nanotech/jellybeans.vim'
"let g:jellybeans_use_term_italics = 1
"let g:jellybeans_overrides = {
"\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
"\}
"if has('termguicolors') && &termguicolors
"    let g:jellybeans_overrides['background']['guibg'] = 'none'
"endif


"Plug 'dracula/vim', { 'as': 'dracula' }
" colorscheme dracula

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end() 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My Own "Vim Scripts"

" Learn to use this to test Vim Scripts
" Plugin 'junegunn/vader.vim'
" I know there are others, but I didn't take good notes
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LightSwitch, LightsOff, and LightsOn functions to switch between dark and
" light modes at dusk and dawn (not accurately), or on demand.

command! -nargs=* LightSwitch call __lightswitch()
command! -nargs=* LightsOn call __light()
command! -nargs=* LightsOff call __dark()
command! -nargs=* LightsAuto call __auto()

function! __lightswitch()
  if (&background == 'dark')
    :call __light()
  else
    :call __dark()
  endif
endfunction

function! __light()
  set background=light
  colorscheme pencil
  "let g:one_allow_italics = 1
  "colorscheme one
endfunction

function! __dark()
  set background=dark
  colorscheme pencil
  "let ayucolor="dark" 
  "colorscheme ayu
  "let g:material_terminal_italics = 1
  "let g:material_theme_style = 'default'
  "colorscheme material
endfunction

" Here's the bit that looks at the time when the init.vim is sourced and chooses
" the backgrough that's least likely to cause the least eye strain
function! __auto()
  if strftime("%H") < 19 && strftime("%H") > 05
    call __light()
  else
    call __dark()
  endif
endfunction

"let g:lights_auto = 1
if (exists('g:lights_auto'))
  call __auto()
else
  colorscheme PaperColor
  "colorscheme matrix
  "colorscheme default
  "let ayucolor="light"  
  "let ayucolor="mirage" 
  "let ayucolor="dark" 
  "colorscheme ayu
endif
"todo(alice) learn how to use variables :(
"function! __manual()
"  echo g:lights_colorscheme
"  colorscheme g:lights_colorscheme
"endfunction
"let g:lights_colorscheme = 'default'
"if (!exists('g:lights_auto') && exists('g:lights_colorscheme'))
"  call __manual()
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here are some general theme escape hatches that you can call upon in an hour
" of need when you can't see the cursor or something else like that.

" hi Visual  guifg=LightBlue:White guibg=LightGray gui=none
" hi Visual  guifg=DarkMagenta guibg=DarkCyan gui=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :reload to source from this config file

command! -nargs=* RE  source ~/.config/nvim/init.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick controls over displaying special characters
"tab:»\,eol:¶\,nbsp:¬\,trail:-
set list listchars=tab:»\ ,nbsp:¬,trail:◊
command! -nargs=* CharactersOn set list listchars=tab:»\ ,eol:¶,nbsp:¬,trail:-
command! -nargs=* CharactersOff set list listchars=tab:»\ ,nbsp:¬,trail:-

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" when they were living together in that same cramped folder, they really startd
" to look like each other.  It was freaky.
" command! -nargs=* IsThisNvim call ReallyIsNvim()

function! ReallyIsNvim()
  if has("nvim")
    echo 'This is nvim.'
  else
    echo 'This is not nvim.'
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                ¯\_(ツ)_/¯
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
