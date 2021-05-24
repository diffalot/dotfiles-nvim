"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alice Davis <alice@gigantic.computer>                             2021-05-09
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         The person I copied this config from wants you to remember:
"                     "Make sure to use single quotes!" *
"
" Compiled from an ancient `.vimrc` that had collected a lot of other people's
" configurations and the examples on the front page of the git repos I've
" stumbled upon over the years during my search for the perfect plugins..
"
" * I just ran across that thing about the double quotes vs. single quotes and
"   it turns out it's pretty important. VimL, VimScript, Vim Script, or
"   Proto-Luan Javinean, whatever you may call it, does not evaluate values
"   stored in single quotes.  So maybe stop yourself every now and the and
"   evaluate what you're evaluating; Be cool, stay in school, and I'll see you
"   next Tuesday. And don't forget to wonder about when I changed the quotes up
"   to and exactly what kind of joke I was trying to make, please, thank you,
"   and you're WELCOME.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To debug the configuration, turn everything off and load it all back in one
" at a time on top of minivimrc is a useful debugging method.
"
" https://github.com/romainl/minivimrc
"source ~/.config/nvim/vimrcs/minivimrc-romainl/vimrc
"
" Running vim with out any plugins everynow and then is a nice reminder of how
" fast it can be `nvim -U NONE -u NONE`
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Distribution specific incantations
if has('win32')
elseif has('mac')
elseif has('unix')
  set shell=zsh
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WELCOME to the wold's _only_ Museum of Truecolor Hacks! Move quickly, and
" rest not you eyes too loooonnnnnnggg, for there is still time for you to
" escape.
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

set t_Co=256

" Our most dearly and recently departed curator, Dr. Otxvurts Con Boedeo used
" to give the most thrilling tales of the time he first encountered on of
" these! You _seeeeee_????????? It is a liiieeee about Truecolor.  Dr. Con
" Boedeo understood.  He understood all too well!

execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

set t_Co=256

set t_ZH=[3m
set t_ZR=[23m

" set t_ZH=^[[3m
" set t_ZR=^[[23m

" Can you see the difference??? Nooooo.... Of course you cannot see the
" difference with your puny mortal eyes. There is no escape, not even for one
" so gifted as our own dearest Dr. Otxvurts.

" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"

" From elsewhere on our glorious internet! Are these two really equvalent!? I
" shall not fall for your trickery again, rando on stack overflow, but I am so
" intrigued...

" My editor Shelly, the joke ruiner, wants me to tell you that to properly
" enter those escape codes for the characters `^[` in `t_ZH=[3m`: First you
" input `t_ZH=` like you've been typing since birth, then mash first <Ctrl-v>
" then <Esc> immediatly afterward to enter in the escape code, and after that
" you can finish it off with the `[3m` in that same old boring way that
" Shelly's always typing

set termguicolors " if you're lying, you'll go blind!!!! (not really, but the
" colors won't work right and it'll hurt your eyes, and what do I know, you
" might burn out a chip. I'm just some stranger on the internet, who onetime
" entertained themselves while they learned Neovim by making up weird little
" stories.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Configuration Built in Functionality
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set encoding=utf-8

filetype plugin on
syntax enable

set mouse=a

set incsearch
set ignorecase
set smartcase
set nohlsearch

set number " Yes, It's Goood!

" two spaces instead of tabs
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" but not always, so here's to you, Python
autocmd FileType python set breakindentopt=shift:4

" hard breaks at 80 cols was my emo band in my 20's
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

" let cursor move across line breaks, please
set whichwrap=b,s,<,>,[,]

set scrolloff=10
set sidescrolloff=15

" echo winwidth('%')
" reports 61 on the phone
if winwidth('%') < 70
  set cmdheight=1
else
  " Give more space for displaying messages.
  set cmdheight=2
end

" Open new windows to the right and below, it'll be less disorienting
set splitbelow
set splitright

" no folding

" What the hell, I just changed my mind
set foldlevel=3

" Do not resize splits when closing one, it is very rude
set noequalalways

" Tab bar and status bar display by default, and there's very little you can
" really do about it, so go grab another sugar water and get back to hive
" maintenance.
set showtabline=2
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu

if has("wildmenu")
  set wildmenu "duh!
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
" I think I better spread these out, cause it's a lot of emotional garbage to
" go through in just one sitting, and i't not reading quite like the label on
" one of Dr. Boedeo's saffron infused mind elixirs with a microdose of Ayahusca
" and a splash of twink blood from Peter Thiel's personal stash.  And you know
" me and you know that's what I'm really going for here.

let mapleader = '\'
let maplocalleader = ','
set timeoutlen=900

" Mobile Responsive Mode
" note that mobile has a much longer timeout for key entry
" TODO find another way to test for 'probably mobile'
if winwidth('%') < 70
  let mapleader = '<Space><Space>'
  set timeoutlen=2500
end

" Claimed Prefixes

"  🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩
" +----------------+-------------+-------------------+
" | Prefix         | Desktop Key | Mobile Resp. Key  |
" | Description    |             |                   |
" +----------------+-------------+-------------------+
" | <leader>       | ✨ \        | ✨ <Space><Space> |
" +----------------+-------------+-------------------+
" | Tab Controls   | <C- ↔️  >    | tt                |
" +----------------+-------------+-------------------+
" | CtrlSpace      | <C-Space>   | <C-Space>         |
" +----------------+-------------+-------------------+
" | Vimwiki        | <C> w       | <C> w             |
" +----------------+-------------+-------------------+
" | Table Mode     | <leader> t  | <leader> t        |
" +----------------+-------------+-------------------+
" | File Controls  | <leader> f  | <leader> f        |
" +----------------+-------------+-------------------+
" | + Git Workflow | <F7>        | <F7>              |
" +----------------+-------------+-------------------+
" | - C/G Tags     | <F8>        | <F8>              |
" +----------------+-------------+-------------------+
" | English Lang.  |             |                   |
" | .   Tools      | <F2>        | <F2>              |
" +----------------+-------------+-------------------+
" | nvim Help      | <F1>        | <F1>              |
" +----------------+-------------+-------------------+
" legend:
"  ✨ = key only mapped on indicated platform
"   + = prefix in progress
"   - = prefix in planning
"   . = prefix a tentative idea

" Utilities
nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F9> :Vista!!<CR>
" <leader> u OpenUrl (set by plugin)
" todo(map) find a better mapping
nmap z<Space> :VimwikiToggleListItem<CR>

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

call plug#begin('~/.config/nvim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Things to Learn
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua REPL with access to neovim-lsp!!
Plug 'rafcamlet/nvim-luapad'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Assists with converting init.vim to init.lua
Plug 'svermeulen/vimpeccable'

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Writing Well
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/preservim/vim-pencil
Plug 'reedes/vim-pencil'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/preservim/vim-wordy
Plug 'preservim/vim-wordy'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
" https://github.com/preservim/vim-lexical#spell-check
Plug 'preservim/vim-lexical'
let g:lexical#spell = 1
let g:lexical#spelllang = ['en_us', 'en_ca', 'en_gb']
let g:lexical#thesaurus = ['~/.config/nvim/language/MobyThesaurus.txt']
let g:lexical#dictionary = ['/usr/share/dict/words']
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType vimwiki call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://vimwiki.github.io/
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [
      \ { 'path': $HOME . '/cronofile/journal',
      \ 'syntax': 'markdown', 'ext': '.mdx'},
      \ { 'path': $HOME . '/cronofile/public/diff.mx',
      \ 'syntax': 'markdown', 'ext': '.mdx'},
      \ { 'path': $HOME . '/cronofile/public/unknown',
      \ 'syntax': 'markdown', 'ext': '.mdx'},
      \]
let g:vimwiki_key_mappings = { 'lists': 0 }
let g:vimwiki_folding = 'expr'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Syntax Highlighting and Indentation
" (Treesitter should be taking care of most of this)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Respect .editorconfig files
Plug 'editorconfig/editorconfig-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The fastest and most versitile, hopefully everything I need is in here
Plug 'sheerun/vim-polyglot'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kevinoid/vim-jsonc'

""" Fish Shell """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dag/vim-fish'
autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'euclidianAce/BetterLua.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"echo nvim_treesitter#statusline(90)  " 90 can be any length
"module->expression_statement->call->identifier

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Language Server
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" completion.nvim keymappings
"
"imap <c-j> <Plug>(completion_next_source) "use <c-j> to switch to previous completion
"imap <c-k> <Plug>(completion_prev_source) "use <c-k> to switch to next completion
"
"" Use <Tab> and <S-Tab> to navigate through popup menu
"" FIXME
""inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
""inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
""map <c-p> to manually trigger completion
"imap <silent> <c-p> <Plug>(completion_trigger)
"
""imap <tab> <Plug>(completion_smart_tab)
""imap <s-tab> <Plug>(completion_smart_s_tab)
"
"" Expand
"imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"
"" Expand or jump
"imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"
"" FIXME snippets module not loading
"" Jump forward or backward
""imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
""smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
""imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
""smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"
"" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
"" See https://github.com/hrsh7th/vim-vsnip/pull/50
"nmap        s   <Plug>(vsnip-select-text)
"xmap        s   <Plug>(vsnip-select-text)
"nmap        S   <Plug>(vsnip-cut-text)
"xmap        S   <Plug>(vsnip-cut-text)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion nvim
Plug 'nvim-lua/completion-nvim'

autocmd BufEnter * lua require'completion'.on_attach()
" Use completion-nvim in every buffer
" FIXME completion lua module should setup through on attach when attaching to
" buffers they're working with, not every buffer.

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'complete_items': ['snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
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
let g:completion_timer_cycle = 80 "default value is 80
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
let g:completion_auto_change_source = 1
" non ins-complete method should be specified in 'mode'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neovim-lsp
" https://github.com/kabouzeid/nvim-lspinstall
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Lsp Helpers and Viewers
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'

" Common Dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" UI
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'liuchengxu/vim-which-key'
"https://github.com/liuchengxu/vim-which-key
"
"I've invited all the dashboards down here so It'll be easier to try out one or
"two at a time adn I asked them to bring their keybindings too
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Main Menu Controls
nnoremap <Space>t :Telescope<CR>
"nnoremap <Space>y :Files<CR>

" Submenu Controls
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
noremap <leader>fh <cmd>Telescope help_tags<cr>

" #CSpace setting...
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" FZF
nmap <C-p> :FZFGitIgnore <CR>
imap <C-p> <Esc>:FZFGitIgnore <CR>
nmap <Leader>fzl <Esc>:Lines<CR>
nmap <Leader>fzb <Esc>:Buffers<CR>
nmap <Leader>fzc <Esc>:Commits<CR>

" Tab Management
nnoremap <silent><C-Right> :tabnext<CR>
nnoremap <silent>tty :tabnext<CR>
nnoremap <silent><C-Left> :tabprevious<CR>
nnoremap <silent>ttr :tabprevious<CR>
nnoremap <silent><C-m> :tabmove<CR>
nnoremap <silent><C-t> :tabnew<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'TC72/telescope-tele-tabby.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF (the best search menu I've found :)
" brew install fsf ag ripgrep perl git-delta
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
" don't search .git or node_modules by default
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --exclude node_modules'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Finder
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<C-Space> https://github.com/vim-ctrlspace/vim-ctrlspace
" outdate docs, but very helpful: https://atlas-vim.readthedocs.io/vim/plugged/vim-ctrlspace/README/#status-line
Plug 'vim-ctrlspace/vim-ctrlspace'

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

let g:CtrlSpaceProjectRootMarkers = [
      \ ".diffalot",
      \ ".git",
      \ ".hg",
      \ ".svn",
      \ ".bzr",
      \ "_darcs",
      \ "CVS"
      \ ]

if executable('rg')
  let g:CtrlSpaceGlobCommand = 'rg --color=never --hidden --glob "!.git" --glob "!node_modules" --files'
elseif executable('fd')
  let g:CtrlSpaceGlobCommand = 'fd --type=file --color=never'
elseif executable('ag')
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"    User Interface Improvements for Code
"
" Looks interesting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/MattesGroeger/vim-bookmarks
Plug 'MattesGroeger/vim-bookmarks'

highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" matching pairs
Plug 'andymass/vim-matchup'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" See previous discussions of the code you are modifying from them what wrote
" it.
Plug 'rhysd/git-messenger.vim'
":GitMessenger or <Leader>gm
let g:git_messenger_include_diff = 'current'
" there are tons of options :https://github.com/rhysd/git-messenger.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/lambdalisue/gina.vim
Plug 'lambdalisue/gina.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP and Ctags Viewer - https://github.com/liuchengxu/vista.vim

Plug 'liuchengxu/vista.vim'
Plug 'preservim/tagbar'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gutentags - https://github.com/ludovicchabant/vim-gutentags

Plug 'ludovicchabant/vim-gutentags'
set statusline+=%{gutentags#statusline()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'kyazdani42/nvim-web-devicons'
Plug 'adelarsq/vim-emoji-icon-theme'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'henrik/vim-open-url'
" Trigger with <leader>u or :OpenURL

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mbbill/undotree'
" there's a lot of options for undotree so it is configures in
" ~/.config/nvim/plugins/conf.undotree.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/TimUntersberger/neogit
Plug 'TimUntersberger/neogit'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdtree'
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>ntr :NERDTreeRefreshRoot<CR>
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'typescript': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Table Mode
" https://github.com/dhruvasagar/vim-table-mode
Plug 'dhruvasagar/vim-table-mode'
" There are so many options, OMG, it does formula too
" :TableModeToggle
" <Leader>ttm starts table mode
" <Leader>ttt Tableize!

let g:table_mode_map_prefix='t'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow Parenthesis
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Commands
" :RainbowParenthesesToggle       " Toggle it on/off
" :RainbowParenthesesLoadRound    " (), the default when toggling
" :RainbowParenthesesLoadSquare   " []
" :RainbowParenthesesLoadBraces   " {}
" :RainbowParenthesesLoadChevrons " <>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Name Tabs with Taboo https://github.com/gcmt/taboo.vim
Plug 'gcmt/taboo.vim'

" make tabs in guis look the same as terminals
set guioptions-=e
set sessionoptions+=tabpages,globals

let g:taboo_tab_format = "\uE0BC  %m%P%I \uE0D4"
let g:taboo_renamed_tab_format = "\uE0BC  %l%I%m \uE0D4"

" TabooRename <tabname> Renames the current tab with the name provided.
" todo(alice) greate fundtion mapped to new tab keybinding that uses TabooOpen
" will require prompt to set or fallback to Taboo default
" TabooOpen <tabname> Opens a new tab and and gives it the name provided.

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
let g:auto_restore_enabled = 0
let g:auto_session_suppress_dirs = ['~/Desktop']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"automatically `tcd` to project directories when opening a file
Plug 'airblade/vim-rooter'
" The public function FindRootDirectory() returns the absolute path to the root directory as a string, if a root directory is found, or an empty string otherwise.

" change directory for the whole tab
let g:rooter_cd_cmd = 'tcd'

" what triggers a scan
let g:rooter_targets = '/,*'
" let g:rooter_targets = '*'
" let g:rooter_targets = '/,*.yml,*.yaml'

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
let g:rooter_manual_only = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line and Icons
" I would love a single status line on tmux, please
"Plug 'narajaon/onestatus'
"Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
"Plug 'hoob3rt/lualine.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" let g:airline_theme = 'pencil'
let g:airline_theme = 'understated'

let g:airline_skip_empty_sections = 1
let g:airline_statusline_ontop = 1
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1

Plug 'edkolev/tmuxline.vim'
Plug 'lambdalisue/battery.vim'

"styling that covers the tabbar with buffers from current tab until you switch
"colors... I guess...
"let g:airline#extensions#tabline#enabled = 1

" Powerline Theme
"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])


" fillchars+=stl:\ ,stlnc:\  "fix for special characters in the bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A little help from tmux to know when vim is focused or not
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Color Themes
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes must be installed during plug initialization, but they can't be
" activated till after plug has loaded every single one, I think, maybe?

" no dark mode
Plug 'NLKNguyen/papercolor-theme'
" colorscheme PaperColor

Plug 'rakr/vim-one'
let g:one_allow_italics = 1
"colorscheme one
"set background=dark
" set background=light

Plug 'kaicataldo/material.vim', { 'branch': 'main' }
let g:material_terminal_italics = 1
let g:material_theme_style = 'lighter'
" colorscheme material

Plug 'ayu-theme/ayu-vim'
Plug 'ayu-theme/ayu-vim-airline'
" let ayucolor="dark"
" let ayucolor="mirage"
" let ayucolor="light"
" colorscheme ayu

Plug 'preservim/vim-colors-pencil'
let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
let g:pencil_neutral_code_bg = 0   " 0=gray (def), 1=normal
let g:pencil_gutter_color = 0      " 0=mono (def), 1=color
let g:pencil_spell_undercurl = 1       " 0=underline, 1=undercurl (def)
let g:pencil_terminal_italics = 1
" colorscheme pencil

Plug 'folke/tokyonight.nvim'
let g:tokyonight_transparent = 0
"let g:tokyonight_style = "night"
"let g:tokyonight_style = "day"
"let g:tokyonight_style = "storm"
" colorscheme tokyonight

" dark only
Plug 'Rigellute/rigel'
" colorscheme rigel

" dark only
Plug 'joshdick/onedark.vim'
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
"let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
" colorscheme onedark

" dark onlu
Plug 'KeitaNakamura/neodark.vim'
let g:neodark#use_256color = 1
let g:neodark#terminal_transparent = 1
let g:neodark#background = '#202020'
" colorscheme neodark

" dark only
Plug 'sts10/vim-pink-moon'
" colorscheme orange-moon
" colorscheme yellow-moon

" I'd forgotten about these
Plug 'dikiaap/minimalist'
Plug 'jonathanfilip/vim-lucius'
Plug 'Lokaltog/vim-distinguished'
"Plug 'chriskempson/base16-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"  Copy from above and set the Colors
"
let g:lights_auto = 1    "    <------ Set the auto mode on or off right here
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! __light()
  " echomsg 'using light colorscheme'
  set background=light
  " colorscheme PaperColor
  colorscheme pencil
  " let g:airline_theme = 'pencil'
  " let g:material_theme_style = 'lighter'
  " colorscheme material
  " let g:airline_theme = 'material'
  " colorscheme one
  " set background=light
  let g:airline_theme = 'silver'
  highlight Comment cterm=italic
endfunction
"    ^       Pick fonts
"    |       In Either of these
"    |-------------------------
"    |       Functions :)
"    v
function! __dark()
  echomsg 'using dark colorscheme'
  set background=dark
  " let g:airline_theme = 'base16color'
  " let g:airline_theme = 'understated'
  " let g:airline_theme = 'serene'
  " let g:airline_theme = 'bubblegum'

  " italic
  " let g:airline_theme = 'understated'
  " colorscheme pencil
  " colorscheme pencil

  " italic
  let ayucolor="dark"
  colorscheme ayu

  " italic
  " let g:tokyonight_style = "night"
  " let g:tokyonight_transparent = 0
  " colorscheme tokyonight

  " colorscheme rigel
  " colorscheme onedark
  " colorscheme neodark
  " colorscheme one
  " set background=dark
  " colorscheme dracula
  " colorscheme orange-moon
  " colorscheme yellow-moon

  let g:airline_theme = 'understated'
  highlight Comment cterm=italic
endfunction

function! __transparent()
  echomsg 'using transparent colorscheme'
  set background=dark

  " let g:tokyonight_style = "night"
  " let g:tokyonight_style = "day"
  let g:tokyonight_style = "storm"

  let g:tokyonight_terminal_colors = 0

  let g:tokyonight_italic_comments = 1
  let g:tokyonight_italic_keywords = 1
  let g:tokyonight_italic_variables = 0
  let g:tokyonight_italic_functions = 0

  let g:tokyonight_transparent = 1

  let g:tokyonight_hide_inactive_statusline = 0

  let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
  let g:tokyonight_dark_sidebar = 1
  let g:tokyonight_dark_float = 1

  let g:tokyonight_colors = { "hint": "orange", "error": "#ff0000" }

  "let g:tokyonight_day_brightness = 0.5

  " Load the colorscheme
  colorscheme tokyonight
  highlight Comment cterm=italic
endfunction

" Oh! it's really easy to make the ui transparent and still themed :D
command! -nargs=* TranparentTheme call __transparent()
command! -nargs=* BecomeTransparent :hi! Normal ctermbg=NONE guibg=NONE <bar>
                                  \ :hi! NonText ctermbg=NONE guibg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO make this setup by variables
" Here's the bit that looks at the time when the init.vim is sourced and chooses
" the backgrough that's least likely to cause the least eye strain
"
function! __auto()
  if strftime("%H") < 19 && strftime("%H") > 05
    call __light()
  else
    call __dark()
  endif
endfunction

if (exists('g:lights_auto') && g:lights_auto == 1)
  echomsg 'using timed colorscheme'
  call __auto()
else
  echomsg 'timed theme switching inactive'
  "echo 'running manually selected'
  "call __light()   "           <-----------  Comment one of those out and
  "call __dark()     "                         let the other set the theme
  "set background=light
  "let g:airline_theme = 'pencil'
  set background=dark
  let g:airline_theme = 'base16color'
  "colorscheme PaperColor
  "colorscheme pencil

  let g:tokyonight_transparent = 0
  let g:tokyonight_style = "night"
  "let g:tokyonight_style = "day"
  colorscheme tokyonight
  highlight Comment cterm=italic
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LightsSwitch, LightsOff, and LightsOn functions to switch between dark and
" light modes at dusk and dawn (not accurately), or on demand.

command! -nargs=* LightsSwitch call __lightswitch()
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

" echo winwidth('%')`
" reports 61 on the phone
if winwidth('%') > 69
  let g:lights_auto = 0
else
  let g:lights_auto = 0
end

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
  "if exists(':TabooRename')
  "  TabooRename nvim
  "end
  augroup ZNV_Config_Reloader
    autocmd! BufWritePost <buffer> execute(g:znv_config_source_command)
  augroup END
  tabm0
endfunction

" Quick controls over displaying special characters
" tab:»\, eol:¶\,nbsp:¬\,trail:-
" and for airline conpatability add on:
" stl:\ , stlnc:\
"
set list listchars=tab:»\ ,nbsp:¬,trail:◊
command! -nargs=* CharactersOn set list listchars=stl:\ ,stlnc:\, tab:»\ ,eol:¶,nbsp:¬,trail:-
command! -nargs=* CharactersOff set list listchars=stl:\ ,stlnc:\, tab:»\ ,nbsp:¬,trail:-

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove trailing whitespace
"
command! -nargs=* WipeTrailingWhitespaces let _save_pos=getpos(".") <Bar>
      \ %s/\s\+$//e <Bar>
      \ call setpos('.', _save_pos)<Bar>
      \ unlet _save_pos<CR>

" I think it's illustrative of problems around training people how to do things
" and learning how to do new thins on your own is that beforeI saw that I
" should be thinking of the different enironments that different commands and
" variables and the user exist in and whicn ones can can cross these barriers
" and how.... anyway here's my original version that wouldn't work where I
" misunderstood where context lived and where the commands work:
"
"     command! -nargs=* WipeTrailingWhitespaces execute("%s/\s\+$//e")
"
" I want to know why this this is cleaner. Maybe mine will break something
" someday and I'll find out ;)
"
" also, is there extra value to using these unnecesary colons as the beginning
" of these commands? (I think these are all commands because a usr can run them
" in command mode, and a user has to call a function from command mode.
"
" Remap for destroying trailing whitespace cleanly
"
"     nnoremap <Leader>wwss :let _save_pos=getpos(".") <Bar>
"         \ :let _s=@/ <Bar>
"         \ :%s/\s\+$//e <Bar>
"         \ :let @/=_s <Bar>
"         \ :nohl <Bar>
"         \ :unlet _s<Bar>
"         \ :call setpos('.', _save_pos)<Bar>
"         \ :unlet _save_pos<CR><CR>
"`
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
  --require('galaxyline-status-lines/spaceline')
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
require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
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
