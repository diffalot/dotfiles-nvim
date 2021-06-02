"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alice Davis <alice@gigantic.computer>                             2021-05-26
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
" Configure Built In Functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set encoding=utf-8

filetype plugin on
syntax enable
set autoindent

set mouse=a

set incsearch
set ignorecase
"set smartcase
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

<<<<<<< Updated upstream
" no hard breaks, but guides at 80 and 120
set textwidth=100
set wrapmargin=10
set "colorcolumn=72,92,100
set colorcolumn=99
hi ColorColumn guibg=aliceblue
||||||| constructed merge base
" hard breaks at 80 cols was my emo band in my 20's
set textwidth=79
set wrapmargin=3
set colorcolumn=80
=======
" hard breaks at 80 cols was my emo band in my 20's
set textwidth=0
" set wrapmargin=3
set colorcolumn=80
set colorcolumn+=120
>>>>>>> Stashed changes

" todo:(alice) figure out good settings for markdown lists
set linebreak
set breakindent
set smartindent

set wrap
set list

" might be good to consider outsourcing gq to fmt or par from inside Vim:
" :%! fmt -w 13
" :%! par 13gr
" You can also set :formatprg to par or fmt and override gq. For more info,
" call :help formatprg inside Vim.

" let cursor move across line breaks, please
set whichwrap=b,s,<,>,[,]

set scrolloff=7
set sidescrolloff=7

" Give more space for displaying messages.
set cmdheight=2

" Open new windows to the right and below, it'll be less disorienting
set splitbelow
set splitright

" I just changed my mind
set foldlevel=3

" Do not resize splits when closing one, it is very rude
set noequalalways

" Tab bar and status bar display by default, and there's very little you can
" really do about it, so go grab another sugar water and get back to hive
" maintenance.
set showtabline=0
set laststatus=2

" echo winwidth('%')
" reports 61 on the phone
if winwidth('%') < 70
  set sidescrolloff=9
else
end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu

if has("wildmenu")
  set wildmenu
  """set wildmode=longest,list:full
  ""set wildmode=longest,list
  set wildmode=lastused,longest:list,lastused:full
  "set wildmode=lastused:longest,list:lastused,list:full
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildignorecase
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Personal Keybindings
" I think I better spread these out, cause it's a lot of emotional garbage to
" go through in just one sitting, and i't not reading quite like the label on
" one of Dr. Boedeo's saffron infused mind elixirs with a microdose of Ayahusca
" and a splash of twink blood from Peter Thiel's personal stash.  And you know
" me and you know that's what I'm really going for here.

let mapleader = ' '
let maplocalleader = ','
set timeoutlen=900

" Mobile Responsive Mode
" note that mobile has a much longer timeout for key entry
" TODO find another way to test for 'probably mobile' |
if winwidth('%') < 70
  set timeoutlen=1500
end

" Claimed Prefixes

" 🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩🚩
" +----------------+-------------+------------------+
" | Prefix         | Desktop Key | Mobile Resp. Key |
" | Description    |             |                  |
" +----------------+-------------+------------------+
" | <leader>       | <Space>     | <Space>          |
" +----------------+-------------+------------------+
" | Tab Controls   | <C-arrows>  | tt               |
" +----------------+-------------+------------------+
" | CtrlSpace      | <C-Space>   | <C-Space>        |
" +----------------+-------------+------------------+
" | Vimwiki        | <C> w       | <C> w            |
" +----------------+-------------+------------------+
" | Table Mode     | <leader> t  | <leader> t       |
" +----------------+-------------+------------------+
" | FZF Controls   | <leader> f  | <leader> f       |
" +----------------+-------------+------------------+
" | + Git Workflow | <F7>        | <F7>             |
" +----------------+-------------+------------------+
" | + C/G Tags     | <F8>        | <F8>             |
" +----------------+-------------+------------------+
" | English Lang.  |             |                  |
" | .   Tools      | <F2>        | <F2>             |
" +----------------+-------------+------------------+
" | nvim Help      | <F1>        | <F1>             |
" +----------------+-------------+------------------+
" legend:
"  ✨ = key only mapped on indicated platform
"   + = prefix in progress
"   - = prefix in planning
"   . = prefix a tentative idea

" Utilities
nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F8>t :TagbarToggle<CR>
nnoremap <F8>v :Vista!!<CR>
" <leader> u OpenUrl (set by plugin)

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
" workflow menus under evaluation

Plug 'liuchengxu/vim-which-key'
"https://github.com/liuchengxu/vim-which-key
"
"I've invited all the dashboards down here so It'll be easier to try out one or
"two at a time adn I asked them to bring their keybindings too
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab Management
nnoremap <silent><C-Right> :tabnext<CR>
nnoremap <silent>tty :tabnext<CR>
nnoremap <silent><C-Left> :tabprevious<CR>
nnoremap <silent>ttr :tabprevious<CR>
nnoremap <silent><C-m> :tabmove<CR>
nnoremap <silent><C-t> :tabnew<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF (the best search menu I've found :)
" brew install fsf ag ripgrep perl git-delta

nmap <Leader>fl <Esc>:Lines<CR>
nmap <Leader>ff <Esc>:Files<CR>
nmap <Leader>fb <Esc>:Buffers<CR>
nmap <Leader>fc <Esc>:CocFzfList<CR>
nmap <Leader>fd <Esc>:CocFzfListResume<CR>
nmap <Leader>fe <Esc>:CocCommand explorer<CR>

nnoremap <silent> <Leader>cc       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <Leader>ce       :<C-u>CocFzfList extensions<CR>

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'antoinemadec/coc-fzf'
" don't search .git or node_modules by default
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --exclude node_modules'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Finder
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

nmap <C-p> :Clap <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'moll/vim-bbye' " optional dependency
"Plug 'aymericbeaumet/vim-symlink'
" tpope recommends this for following symlinks it CtrlSpace ever gives trouble
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"<C-Space> https://github.com/vim-ctrlspace/vim-ctrlspace
" outdate docs, but very helpful:
" https://atlas-vim.readthedocs.io/vim/plugged/vim-ctrlspace/README/#status-line
Plug 'vim-ctrlspace/vim-ctrlspace'

let g:CtrlSpaceDefaultMappingKey = '<C-space> '

" let g:CtrlSpaceStatuslineFunction = 'ctrlspace#api#Statusline()'

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 0
let g:CtrlSpaceSaveWorkspaceOnExit = 0

let g:CtrlSpaceUseArrowsInTerm = 1
let g:CtrlSpaceSortHelp = 1

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
  let g:CtrlSpaceGlobCommand =
    \ 'rg --color=never --hidden --glob "!.git" --glob "!node_modules" --files'
elseif executable('fd')
  let g:CtrlSpaceGlobCommand = 'fd --type=file --color=never'
elseif executable('ag')
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" New Plugins to try
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/tpope/vim-dispatch
"Plug 'tpope/vim-dispatch'
"let g:dispatch_no_maps = 1
"
" https://github.com/neomake/neomake
"Plug 'neomake/neomake'
"let g:neomake_open_list = 2
"
Plug 'skywind3000/asyncrun.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Things to Learn
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common Dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua REPL with access to neovim-lsp!!
Plug 'rafcamlet/nvim-luapad'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Assists with converting init.vim to init.lua
Plug 'svermeulen/vimpeccable'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REPL
Plug 'metakirby5/codi.vim'

let g:codi#width = 0.2      " is the width of the Codi split.
let g:codi#rightsplit = 0   " is whether or not Codi spawns on the right side.
let g:codi#rightalign = 1   " is whether or not to right-align the Codi buffer.
let g:codi#autoclose  = 0   " is whether or not to close Codi when the
                            "   associated buffer is closed.
let g:codi#raw = 0          " is whether or not to display interpreter results
                            "   without alignment formatting (useful for
                            "   debugging).
let g:codi#sync = 0         " is whether or not to force synchronous execution.
                            "   No reason to touch this unless you want to
                            "   compare async to sync.
" let g:codi#autocmd        " determines what autocommands trigger updates. See
                            "   the documentation for more information.
let g:codi#aliases = {
      \ 'javascript.jsx': 'javascript',
      \ 'typescript.tsx': 'typescript',
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Syntax Highlighting and Indentation
" (Treesitter should be taking care of most of this)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""" Lua """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'euclidianAce/BetterLua.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"echo nvim_treesitter#statusline(90)  " 90 can be any length
"module->expression_statement->call->identifier

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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



"cronofiler sync command
"watch vimwiki filetypes for save to run as autocmd
"run hidden when vim first opens, and when a workspace is shutdown in :wide_enoughCtrlSpace if possible


" todo(map) find a better mapping
nmap z<Space> :VimwikiToggleListItem<CR>

let g:vimwiki_key_mappings = { 'lists': 0 }
let g:vimwiki_folding = 'expr'
let g:vimwiki_hl_headers = 1
let g:vimwiki_use_calendar = 1
let g:vimwiki_dir_link = 'index'
let g:vimwiki_list = [
    \ { 'syntax': 'markdown',
    \   'name': 'journals',
    \   'description': 'personal todos, notes, scraps, etc.',
    \   'index': 'index',
    \   'maxhi': 1,
    \   'auto_diary_index': 1,
    \   'auto_tags': 1,
    \   'auto_generate_links': 1,
    \   'auto_generate_tags': 1,
    \   'ext': '.mdx',
    \   'path': $HOME . '/cronofiles/journal' },
    \ { 'syntax': 'markdown',
    \   'name': 'unfiled',
    \   'description': 'lots of scraps that I will probably never read but may want to find again',
    \   'index': 'index',
    \   'maxhi': 0,
    \   'auto_diary_index': 0,
    \   'auto_tags': 0,
    \   'auto_generate_links': 0,
    \   'auto_generate_tags': 0,
    \   'ext': '.mdx',
    \   'path': $HOME . '/cronofiles/unfiled' },
    \ { 'syntax': 'markdown',
    \   'name': 'diff.mx',
    \   'description': 'a blog where I post anything I learn about tech that took a lot of googleing, so maybe it will be easier for you',
    \   'index': 'about',
    \   'maxhi': 0,
    \   'auto_diary_index': 0,
    \   'auto_tags': 0,
    \   'auto_generate_links': 0,
    \   'auto_generate_tags': 0,
    \   'ext': '.mdx',
    \   'path': $HOME . '/cronofiles/diff.mx' },
    \ { 'syntax': 'markdown',
    \   'name': 'cronofiler',
    \   'description': 'the software I use to keep my scraps from overwelming me, maybe one day it will be useful enough to share',
    \   'index': 'readme',
    \   'maxhi': 0,
    \   'auto_diary_index': 0,
    \   'auto_tags': 0,
    \   'auto_generate_links': 0,
    \   'auto_generate_tags': 0,
    \   'ext': '.mdx',
    \   'path': $HOME . '/Desktop/cronofiler' },
    \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.config/nvim/init/ui.plug.vim
source $HOME/.config/nvim/init/themes.plug.vim
source $HOME/.config/nvim/init/coc.nvim.plug.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

""""""""""""""""""""""""""""""""""""":""""""""""""""""""""""""""""""""""""""""""

source $HOME/.config/nvim/init/themes.functions.vim
source $HOME/.config/nvim/init/utils.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.config/nvim/init/infolines.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                ¯\_(ツ)_/¯
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {  "bash", "css", "dockerfile", "fish", "graphql", "html",
                        "javascript", "jsdoc", "json", "jsonc", "lua", "python",
                        "regex", "rust", "toml", "tsx", "typescript", "yaml",
                        "sparql" },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
}
EOF
