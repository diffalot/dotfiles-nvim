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
"
" Compiled from an ancient `.vimrc` that had collected a lot of other people's
" configurations and the examples on the front page of the git repos I've
" stumbled upon over the years during my search for the perfect plugins..
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Things to Install
"
" https://github.com/vigoux/LanguageTool.nvim
"
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

" echo winwidth('%')
" reports 61 on the phone
if winwidth('%') < 70
  set nowrap
else
  set wrap
end

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

" no folding
set nofoldenable

" tab bar and status bar display by default
set showtabline=2
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu

if has("wildmenu")
  set wildmenu
  set wildmode=longest,list:full
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

" Persistent scratch
Plug 'diffalot/scratch.vim'
let g:scratch_top = 1
let g:scratch_height = 18 
let g:scratch_filetype = 'markdown'
let g:scratch_persistence_file = '~/.scratch.md'
let g:scratch_autohide = 1 "&hidden
"let g:scratch_insert_autohide = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File management

" Fugitive - https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

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

" Git modifications noted in the gutter
" Plug 'airblade/vim-gitgutter'

" :grep
set grepprg=rg\ --vimgrep

" fuzzy finder
" brew install fsf ag ripgrep perl git-delta 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" don't search .git or node_modules by default
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --exclude node_modules'

" make netrw act like nerdtree :)
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netr_winsize = -35
let g:netrw_keepdir = 0


Plug 'kyazdani42/nvim-web-devicons'
"" https://github.com/kyazdani42/nvim-tree.lua
"Plug 'kyazdani42/nvim-tree.lua'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make the editor handle a lot of the thinking

Plug 'editorconfig/editorconfig-vim'

Plug 'mbbill/undotree'
" there's a lot of options for undotree so it is configures in
" ~/.config/nvim/plugins/conf.undotree.vim

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
" To Install, etc
"
" https://github.com/neoclide/coc-snippets
" https://github.com/rome/tools
" coc-rome
"
" https://github.com/neoclide/coc-sources
"
" Installed
"
" coc-vimlsp
" coc-tsserver
" coc-json
" coc-html 
" coc-css 
" coc-markdown-lint 
" coc-sh 
" coc-dictionary 
" coc-tag
" coc-git
" coc-word
" coc-emoji 
" coc-html-css-support
" coc-tailwindcss
" coc-cssmodules
" coc-yaml
" coc-sql
" coc-prettier
" coc-stylelintplus
" coc-snippets
" coc-graphql
" coc-eslint
" coc-deno 
" coc-pyright
" coc-rust-analyzer 
" coc-prisma
" coc-vetur
" coc-yank
" coc-gist
" coc-translator
" https://github.com/neoclide/coc-neco

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc Launguage Server Client
" Or build from source code by using yarn: https://yarnpkg.com
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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Keybindings
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" the plan is to add these in one at a time, reloading each time, and we'll see
" how it goes, lol

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Personal Keybindings

set timeoutlen=1250
let mapleader='\'

" Utilities
nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F9> :Vista!!<CR>
" (set by plugin) <leader> u OpenUrl

" File Management
nnoremap ,p :GFiles<CR>
nnoremap ,o :Files<CR>

" Buffer Controls
nnoremap <C-Space> :Buffers<CR>

nnoremap <silent><C-Right> :tabnext<CR>
nnoremap <silent><C-Left> :tabprevious<CR>
nnoremap <silent><C-M> :tabmove<CR>
nnoremap <silent><C-t> :tabnew<CR>

" NVim Tree
nnoremap <leader>n :Vexplore<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP and Ctags Viewer - https://github.com/liuchengxu/vista.vim

Plug 'liuchengxu/vista.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EleLine - https://github.com/liuchengxu/eleline.vim

Plug 'liuchengxu/eleline.vim'
let g:eleline_powerline_fonts = 1

" echo winwidth('%')
" reports 61 on the phone
if winwidth('%') < 70
  let g:eleline_slim = 1
end

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

" echo winwidth('%')
" reports 61 on the phone
if winwidth('%') > 69
  let g:lights_auto = 1
end

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end() 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My Own "Vim Scripts"

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
  set background=dark
  colorscheme pencil
  "colorscheme PaperColor
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
