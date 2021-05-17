"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alice Davis <alice@gigantic.computer>                             2021-05-09
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         The person I copied this config from wants you to remember:
"                     'Make sure you use single quotes!'
"
" Compiled from an ancient `.vimrc` that had collected a lot of other people's
" configurations and the examples on the front page of the git repos I've
" stumbled upon over the years during my search for the perfect plugins..
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To debug the configuration, turn everything off and load it all back in one
" at a time with up on top of minivimrc useful debugging setup.
"
" source ~/.config/nvim/vimrcs/minivimrc-romainl/vimrc
"
" https://github.com/romainl/minivimrc
"
" Running vim with out any plugins everynow and then is a nice reminder of how
" fast it can be `nvim -U NONE -u NONE`
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The hopefully brief section of fixes
"
" Distribution specific initialization
if has('win32')
elseif has('mac')
elseif has('unix')
  set shell=zsh
endif

" It's worth a nasty bug to have italics
" https://rsapkf.xyz/blog/enabling-italics-vim-tmux
" note that I did not follow all of those directions, just this bit here
set t_ZH=[3m
set t_ZR=[23m

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
" I've seen worse...
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manage built in options

set nocompatible

set encoding=utf-8

filetype plugin on
syntax enable

set mouse=a

set incsearch
set ignorecase
set smartcase
set nohlsearch

set number

" two spaces instead of tabs
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" but not always, here's to you, Python
autocmd FileType python set breakindentopt=shift:4

" hard breaks at 80 cols
set textwidth=79
set wrapmargin=3
set colorcolumn=80

" todo:(alice) figure out good settings for markdown lists
set linebreak
set breakindent
set smartindent

set nowrap
set list

" might be good to consider outsourcing gq to fmt or par from inside Vim:
" :%! fmt -w 13
" :%! par 13gr
" You can also set :formatprg to par or fmt and override gq. For more info, call :help formatprg inside Vim.

" let cursor move across line breaks
set whichwrap=b,s,<,>,[,]

" echo winwidth('%')
" reports 61 on the phone
if winwidth('%') < 70
  set cmdheight=1
else
  " Give more space for displaying messages.
  set cmdheight=2
end

" Open new windows to the right and below
set splitbelow
set splitright

" no folding
"set nofoldenable
set foldlevel=4

" do not resize splits when closing one
set noequalalways

" tab bar and status bar display by default
set showtabline=2
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu

if has("wildmenu")
  set wildmenu
  ""set wildmode=longest,list:full
  "set wildmode=longest,list
  set wildmode=longest,lastused,list:full
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildignorecase
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Personal Keybindings

set timeoutlen=900
let mapleader = ','
let maplocalleader = 'q'

" Utilities
nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F9> :Vista!!<CR>
" (set by plugin) <leader> u OpenUrl
nmap z<Space> :VimwikiToggleListItem<CR>

" Main Menu Controls
nnoremap <Space>t :Telescope<CR>

" Submenu Controls
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
noremap <leader>fh <cmd>Telescope help_tags<cr>

" Tab Management
nnoremap <silent><C-Right> :tabnext<CR>
nnoremap <silent>tty :tabnext<CR>
nnoremap <silent><C-Left> :tabprevious<CR>
nnoremap <silent>ttr :tabprevious<CR>
nnoremap <silent><C-m> :tabmove<CR>
nnoremap <silent><C-t> :tabnew<CR>

" Floating Terminals (should probably find a better namespace? Or maybe just
" unify this one...)
"
"      you can release the cursor from the jaws of the terminal with
"
"    ( Control and Backslash ) followed by ( Control and Shift and N )
"
"                    [ ctrl - \ ] [ ctrl - N ]
" 
nnoremap <silent><leader>n :FloatermNew nnn<CR>
nnoremap <silent><leader>cs :FloatermNew --name=split --wintype=split --height=5 --width=1.0 --position=belowright --autohide=0 --autoclose=2<CR>
nnoremap <silent><leader>cd :FloatermNew<CR>

nnoremap <leader>mm :FloatermToggle<CR>
nnoremap <leader><Space> :FloatermNext<CR>
nnoremap <leader>zxc :FloatermKill<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" completion.nvim keymappings

imap <c-j> <Plug>(completion_next_source) "use <c-j> to switch to previous completion
imap <c-k> <Plug>(completion_prev_source) "use <c-k> to switch to next completion

" Use <Tab> and <S-Tab> to navigate through popup menu
" FIXME
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

"imap <tab> <Plug>(completion_smart_tab)
"imap <s-tab> <Plug>(completion_smart_s_tab)

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" FIXME snippets module not loading
" Jump forward or backward
"imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" git workflow
"   the catchup phase
"     fetch and graph
"       - get a review of where your code is in relation to wveryone els'
nnoremap <F7> :Git fetch --all <bar> :Flogsplit -all -date=short -sort=author<CR>
"     cherry pick - when theres only one really solid feature in the middle of sea of crufty commits, start a new branch and pull in only the best code
"     rebase --a good strategy for making your working branch merge cleanly into main
"     merge --ff-only a great way to catch ip mon ff merges should be avoided
"       if at all possible
"   the work phase
"     git status and logs
"nnoremap <F7>s :echo system("git status")<CR>  "make this compact or a popup
nnoremap <F7>l :Git log<CR>
nnoremap <F7>o :echo system("git log -1 --oneline --pretty=format:'%s'")<CR>
"     git diff
nnoremap <F7>q :Git diff<CR>
nnoremap <F7>d :Gvdiffsplit<CR>
nnoremap <F7>m :Gclog<CR>
"     commit a lot"
"       [trivial]({*topic}) {*note}
"         - should a small cleanup and if you can git blame this on a commit that hasnt been merged to main, squash it in there
"       [wip] {optional note and message}
"         - you're sure this is going to be a part of the feature, and you want a checkpoint even thou you plan on squashing this all together eventually
"       amend
"         - old wip in progress is gone this is the new wip
"         - works perfectly as a trivial cleanup to a commit you just mapleader
"       undo
"         - reset to right before the last commit when all the files had been staged but not yet committed.  leaving everything staged helps anything you edit off the staged filed will be shown in git status and git diffw
"       stash -p
"         - store small cleanups or experiments that aren't directly related to the feature you wanted.  store these separately and commit the lefovers as a single commit of cleanup before your geagure goed throufh
"         - if two unrelated changes wind up in the same hunk, try to split them or handle them as single commits with undo
"       view stash {#}
"         - review what you have in the stashes you've collected
"       pop stash {#}
"         - this is a great time to group related items into a single entity
"       interactive rebase {root branch or commit--defaults to main} {sort and collect iteration passthrough number}
"         - arrange small commits that contain nothing but all the code for one feature- it will help other people know what the code does ig they see all of it at oncr with nothing to distract them
"       atomic commit [{topic}]({subtopic|action}) summary of change as action
"         - it's like squashing a pr into master, except you're doing it manuallyand removing anuthing that was not strictly a part of your feature
"    push and pr you'll just want to use rebase and merges as necessary

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No Key Maps Below Here!!!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Still Being Configured
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I want to learn Lua and I wish I knew Vim Script better

" Assists with converting init.vim to init.lua
Plug 'svermeulen/vimpeccable'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Finder
" It's very very fast

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/folke/todo-comments.nvim
Plug 'folke/todo-comments.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REPL
Plug 'metakirby5/codi.vim'

let g:codi#width = 0.2     " is the width of the Codi split.
let g:codi#rightsplit = 0  " is whether or not Codi spawns on the right side.
let g:codi#rightalign = 1  " is whether or not to right-align the Codi buffer.
let g:codi#autoclose  = 0  " is whether or not to close Codi when the associated buffer is closed.
let g:codi#raw = 0         " is whether or not to display interpreter results without alignment formatting (useful for debugging).
let g:codi#sync = 0        " is whether or not to force synchronous execution. No reason to touch this unless you want to compare async to sync.
" let g:codi#autocmd       " determines what autocommands trigger updates. See the documentation for more information.
let g:codi#aliases = {
      \ 'javascript.jsx': 'javascript',
      \ 'typescript.tsx': 'typescript',
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion nvim
Plug 'nvim-lua/completion-nvim'
" Use completion-nvim in every buffer
" FIXME completion lua module can't be found
autocmd BufEnter * lua require'completion'.on_attach()

"let g:completion_chain_complete_list = [
"    \{'complete_items': ['lsp', 'snippet']},
"    \{'mode': '<c-p>'},
"    \{'mode': '<c-n>'}
"\]
"let g:completion_chain_complete_list = {
"    \ 'lua': [
"    \    {'mode': '<c-p>'},
"    \    {'mode': '<c-n>'}
"    \],
"    \ 'default': [
"    \    {'complete_items': ['lsp', 'snippet']},
"    \    {'mode': '<c-p>'},
"    \    {'mode': '<c-n>'}
"    \]
"\}

" possible value: "length", "alphabet", "none"
let g:completion_sorting = "length"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

let g:completion_matching_ignore_case = 1

"let g:completion_matching_smart_case = 1

let g:completion_trigger_keyword_length = 3 " default = 1

let g:completion_trigger_on_delete = 1

let g:completion_timer_cycle = 200 "default value is 80


" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_auto_change_source = 1

" non ins-complete method should be specified in 'mode'
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'complete_items': ['snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Every Day Use
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Communications

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/preservim/vim-wordy
Plug 'preservim/vim-wordy'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://vimwiki.github.io/
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/wiki/',
      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_key_mappings = { 'lists': 0 }

let g:vimwiki_folding = 'expr'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Heavy Duty Programming shit
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
" Fugitive - https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

let g:flog_default_arguments = {
                      \ 'all': 1,
                      \ 'max_count': 2000,
                      \ 'date': 'short',
                      \ 'sort': 'author'}
let g:flog_custom_format = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
""" This is the same as the built-in log command (flog#build_log_command)
""function! FlogBuildLog() abort
""  " Same as "git --git-dir=" . flog#get_fugitive_git_dir()
""  " The git dir will be the current buffer's ".git" directory
""  let l:command = flog#get_fugitive_git_command()
""  let l:command .= ' log'
""  let l:command .= ' --'
""  " Args and paths that would normally be passed to "git log" based on Flog options
""  let l:command .= flog#build_log_args()
""  let l:command .= ' -- '
""  let l:command .= flog#build_log_paths()
""
""  return l:command
""endfunction

"let g:flog_build_log_command_fn = 'FlogBuildLog'

" DiffView - https://github.com/sindrets/diffview.nvim
Plug 'sindrets/diffview.nvim'

" Mergetool
" https://github.com/samoshkin/vim-mergetool
Plug 'samoshkin/vim-mergetool'

" Signify - https://github.com/mhinz/vim-signify
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
set updatetime=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"    User Interface Improvements
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files

Plug 'mbbill/undotree'
" there's a lot of options for undotree so it is configures in
" ~/.config/nvim/plugins/conf.undotree.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :grep
set grepprg=rg\ --vimgrep

Plug 'BurntSushi/ripgrep'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make netrw act like nerdtree :)
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = -30
let g:netrw_keepdir = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'henrik/vim-open-url'
" Trigger with <leader>u or :OpenURL

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Name Tabs with Taboo https://github.com/gcmt/taboo.vim
Plug 'gcmt/taboo.vim'

" make tabs in guis look the same as terminals
set guioptions-=e
set sessionoptions+=tabpages,globals

let g:taboo_tab_format = "\uE0BC  %P%I \uE0B1 %f%l%U%m\uE0BE"
let g:taboo_renamed_tab_format = "\uE0BC  %l%I%m \uE0D4"

" TabooRename <tabname> Renames the current tab with the name provided.
" todo(alice) greate fundtion mapped to new tab keybinding that uses TabooOpen
" will require prompt to set or fallback to Taboo default
" TabooOpen <tabname> Opens a new tab and and gives it the name provided.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"automatically `tcd` to project directories when opening a file
Plug 'airblade/vim-rooter'
" The public function FindRootDirectory() returns the absolute path to the root directory as a string, if a root directory is found, or an empty string otherwise.

" change directory for the whole tab
let g:rooter_cd_cmd = 'tcd'

" what triggers a scan
let g:rooter_targets = '/,*'
"let g:rooter_targets = '*'
"let g:rooter_targets = '/,*.yml,*.yaml'

" how to identify a root directory
let g:rooter_patterns = [
      \ '.git',
      \ '>~/work',
      \ '>.config',
      \ '>~/.homesick/repos/',
      \ '=/home/alice',
      \ ]

" follow file and directory links
let g:rooter_resolve_links = 1

" if blank, will not change directory (can be home or current
let g:rooter_change_directory_for_non_project_files = ''

" manual mode
let g:rooter_manual_only = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session management
" :SaveSession " saves or creates a session in the currently set `auto_session_root_dir`.
" :RestoreSession " restores a previously saved session based on the `cwd`.
" :DeleteSession " deletes a session in the currently set `auto_session_root_dir`.

Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'
"let g:auto_session_root_dir = $HOME . '.config/nvim/sessions'
let g:auto_session_enable_last_session = 0
let g:auto_session_enabled = 0
let g:auto_save_enabled = 0
let g:auto_restore_enabled = 1
let g:auto_session_suppress_dirs = ['~/Desktop']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A little help from tmux to know when vim is focused or not
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line and Icons

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'adelarsq/vim-emoji-icon-theme'

" I would love a single status line on tmux, please
"Plug 'narajaon/onestatus'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Language Server
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neovim-lsp
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

Plug 'nvim-lua/lsp-status.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'TC72/telescope-tele-tabby.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"echo nvim_treesitter#statusline(90)  " 90 can be any length
"module->expression_statement->call->identifier

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP and Ctags Viewer - https://github.com/liuchengxu/vista.vim

Plug 'liuchengxu/vista.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gutentags - https://github.com/ludovicchabant/vim-gutentags

Plug 'ludovicchabant/vim-gutentags'
set statusline+=%{gutentags#statusline()}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Syntax Highlighting and Indentation
" Respect .editorconfig files
Plug 'editorconfig/editorconfig-vim'

"" The fastest and most versitile, hopefully everything I need is in here
"Plug 'sheerun/vim-polyglot'
"
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kevinoid/vim-jsonc'
"
Plug 'dag/vim-fish'
autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr

Plug 'euclidianAce/BetterLua.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"    User Interface Improvements
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes must be installed during plug initialization, but they can't be
" activated till after plug has loaded every single one, I think, maybe?

" echo winwidth('%')
" reports 61 on the phone
if winwidth('%') > 69
  let g:lights_auto = 0
end

Plug 'preservim/vim-colors-pencil'
let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high
let g:pencil_neutral_headings = 0   " 0=blue (def), 1=normal
let g:pencil_neutral_code_bg = 0   " 0=gray (def), 1=normal
let g:pencil_gutter_color = 1      " 0=mono (def), 1=color
let g:pencil_spell_undercurl = 1       " 0=underline, 1=undercurl (def)
let g:pencil_terminal_italics = 1
"colorscheme pencil

Plug 'rakr/vim-one'
" colorscheme one
" set background=dark
" set background=light
let g:one_allow_italics = 1

Plug 'NLKNguyen/papercolor-theme'
" colorscheme PaperColor

Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" let g:material_terminal_italics = 1
" let g:material_theme_style = 'lighter'
" colorscheme material

Plug 'ayu-theme/ayu-vim'
" let ayucolor="mirage"
" let ayucolor="dark"
" let ayucolor="light"
" colorscheme ayu

" not sure about these yet

Plug 'Rigellute/rigel'

Plug 'nanotech/jellybeans.vim'
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

Plug 'folke/tokyonight.nvim'
"let g:tokyonight_style = "night"
"let g:tokyonight_style = "day"
let g:tokyonight_transparent = 0
"colorscheme tokyonight

Plug 'sts10/vim-pink-moon'

Plug 'arcticicestudio/nord-vim'

Plug 'dracula/vim', { 'as': 'dracula' }
" colorscheme dracula

Plug 'marcopaganini/mojave-vim-theme'

Plug 'reedes/vim-pencil'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My Own Vim Scripts

" Learn to use this to test Vim Scripts
" Plugin 'junegunn/vader.vim'
" I know there are others, but I didn't take good notes
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :ManageNvimConfig & :ReloadNvimConfig
"
" This contains two commands for managing the vim config, I suppose one of
" the reload command could be done away with because the file
" automatically reloads... But nah, I'm sure I can break the management
" command eventually.
"
" required variable:
" let g:znv_config_dir = '$HOME/.config/nvim'
"
" * `ReloadNvimConfig` re-sources the init.vim, and it sources it from the
"   dotfiles-nvim directory in ~/.homesick (at least in my setup)
"
" * `ManageNvimConfig` opens up a new tab at tab index 0 (farthest to the
"   left), and sets the working directory of that tab to the
"   `g;znv_config_dir` you set in your init.vim without affecting any
"   other tabs you may have open.

" Required variables
let g:znv_config_dir = '$HOME/.homesick/repos/dotfiles-nvim/home/.config/nvim'

" Open a new tab, switch to it, change the tab working directory to homeshick
" dotfiles-nvim, and open the init.vim
command! -nargs=* ManageNvimConfig call ZNV_Setup()

" Run Reload to source from the config in dotfiles-nvim
command! -nargs=* ReloadNvimConfig execute(g:znv_config_source_command)

" computed variables
let g:znv_config_source_command = 'source' . expand(g:znv_config_dir) . '/init.vim'

function! ZNV_Setup()
  execute 'tabnew' . g:znv_config_dir . '/init.vim'
  execute 'tcd' . g:znv_config_dir
  if exists(':TabooRename')
    TabooRename nvim
  end
  augroup ZNV_Config_Reloader
    autocmd! BufWritePost <buffer> execute(g:znv_config_source_command)
  augroup END
  tabm0
endfunction

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
  echomsg 'using light colorscheme'
  "set background=light
  "let ayucolor="light"
  "colorscheme ayu
  " let g:material_terminal_italics = 1
  " let g:material_theme_style = 'lighter'
  " colorscheme material
  colorscheme one
  set background=light
endfunction

function! __dark()
  echomsg 'using dark colorscheme'
  colorscheme one
  set background=dark
  " let g:tokyonight_style = "night"
  " colorscheme tokyonight
endfunction

"let g:lights_auto = 1
if (exists('g:lights_auto') && g:lights_auto == 1)
  echom 'using timed colorscheme'
  call __auto()
else
  echomsg 'timed theme switching inactive'
  "call __light()
  call __dark()
endif

" TODO make this setup by variables
" Here's the bit that looks at the time when the init.vim is sourced and chooses
" the backgrough that's least likely to cause the least eye strain
function! __auto()
  if strftime("%H") < 19 && strftime("%H") > 05
    call __light()
  else
    call __dark()
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick controls over displaying special characters
"tab:»\,eol:¶\,nbsp:¬\,trail:-
set list listchars=tab:»\ ,nbsp:¬,trail:◊
command! -nargs=* CharactersOn set list listchars=tab:»\ ,eol:¶,nbsp:¬,trail:-
command! -nargs=* CharactersOff set list listchars=tab:»\ ,nbsp:¬,trail:-

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove trailing whitespace
command! -nargs=* WipeTrailingWhitespaces execute("%s/\s\+$//e")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" In Progress
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO change to nearest parent project directory when opening a new tab no matter
" where the tab was created
"
"function! OnTabEnter(path)
"  if isdirectory(a:path)
"    let dirname = a:path
"  else
"    let dirname = fnamemodify(a:path, ":h")
"  endif
"  execute "tcd ". dirname
"endfunction

"autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git commit each trivial cleanup task between reorgs so they git won't ever
" give a fuck about rebasing import things since it's been well fed

"command! -nargs=* GitTrivial echo system('git commit % -m "[clean](trivial) small and dangerous"')

" todo(alice): learn about filetype autocommands
"
" keep an eye out for if
" there's a way to assign multiple filetypes to a buffer, cause that would help
" with formatting vimwiki/markdown pages
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       :help autocmd-events
" Text File Formatting
"
" https://learnvimscriptthehardway.stevelosh.com/chapters/12.html

":autocmd FileType javascript 
":autocmd BufNewFile,BufRead *.html setlocal nowrap
"
" * wiki pages should trigger the lsp markdown lint and format settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here are some general theme escape hatches that you can call upon in an hour
" of need when you can't see the cursor or something else like that.

" hi Visual  guifg=LightBlue:White guibg=LightGray gui=none
" hi Visual  guifg=DarkMagenta guibg=DarkCyan gui=none

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

"lua << EOF
"EOF

lua << EOF
  require('galaxyline-status-lines/spaceline')
  --require('galaxyline-status-lines/status-line')
  --require('galaxyline-status-lines/galaxyline')
  --require('galaxyline-status-lines/statusline')
EOF



lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    position = "top", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    action_keys = { -- key mappings for actions in the trouble list
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small poup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  }
EOF

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
     signs = true, -- show icons in the signs column
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
    warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
    info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
    hint = { "LspDiagnosticsDefaultHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
  },
  -- regex that will be used to match keywords.
  -- don't replace the (KEYWORDS) placeholder
  pattern = "(KEYWORDS):",
  -- pattern = "(KEYWORDS)", -- match without the extra colon. You'll likely get false positives
  -- pattern = "-- (KEYWORDS):", -- only match in lua comments
  }
EOF


lua << EOF
require("telescope").load_extension("session-lens")
require('telescope').load_extension('gh')
require('telescope').setup{
  extensions = {
    tele_tabby = {
      use_highlighter = true,
    }
  }
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {  "bash", "css", "dockerfile", "fish", "graphql", "html",
                        "javascript", "jsdoc", "json", "jsonc", "lua", "python",
                        "regex", "rust", "toml", "tsx", "typescript", "yaml",
                        "sparql" }
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF


lua <<EOF
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
EOF
