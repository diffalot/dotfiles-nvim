"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Kill Switches for Expensive Plugins

" Easytags Kill Switch will stop the scanning of source files for tags.
" Comment this out and Easytags will scan while you are not typing

let g:easytags_on_cursorhold = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The person I copied this config from wants you to remember:
" 'Make sure you use single quotes!'
" 
" Todo:
" [ ] Study how to test Vim Script with Vader
" [ ] Figure out why home/end are broken, but only sometimes 😨
"     [ ] get a solid fix for the tmux terminfo
" [ ] Find find something better than `gq` for reflowing text
"     :help formatoptions fo fo-table formatlistpat auto-format
"     https://vim.fandom.com/wiki/Automatic_formatting_of_paragraphs
" [ ] Make tmux clipboard sync with macOS clipboard
"
" Done:
" [x] Make yank and put in nvim syncronize with tmux
"
" Compiled from an ancient `.vimrc` that had collected a lot of other people's
" configurations and the example on the front page of the CoC git repo.
" https://github.com/neoclide/coc.nvim
" 
" Notes:
"   tmux - vim - clipboard pasting
"   
"   *Copying*
"
"   | System Type | Copy To           | How to Copy to It                                                                                             |
"   | macOS       | the only one      | <apple> + <c>                                                                                                 |
"   | vim         | vim yank? buffer  | (select text), <y>                                                                                            |
"   | vim         | new tmux buffer   | sycronized with yank                                                                                          |
"   | tmux        | new tmux buffer   | <bind-key>, [, (navigate to beginning of desired selection), <space>, (navigate to end of selection), <enter> |
"   | tmux        | new tmux buffer   | select test with the mouse                                                                                    |
" 
"
"   *Pasting*
"
"   | System      | Past From          | How to Paste from It                        |
"   | tmux        | vim yank           | unknown (use paste from newest buffer)      |
"   | tmux        | newest tmux buffer | <bind-key>, ]                               |
"   | tmux        | macOS              | depends on terminal, usually: <apple> + <c> |
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To Debug the Configuration, turn things off and load up minivrc
"
" source ~/.config/nvim/minivimrc/vimrc
"
" https://github.com/romainl/minivimrc
"
" Running vim with out any plugins everynow and then is a nice reminder of how
" fast it can be
" nvim -U NONE -u NONE
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I wish people distributed more shell scripts written in fish
if &shell =~# 'fish$'
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
" Oh, I guess we're starting
"

let mapleader=" "
set timeoutlen=1750

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

call plug#begin('~/.config/nvim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File management

" Git modifications noted in the gutter
Plug 'airblade/vim-gitgutter'

" :grep
"
set grepprg=rg\ --vimgrep

" fuzzy finder
" brew install fsf ag ripgrep perl git-delta 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>n :FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make the editor play well with others

Plug 'editorconfig/editorconfig-vim'

Plug 'sindrets/diffview.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'tpope/vim-endwise'

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

" I'm not sure how fast this one is, I know it has Intellisense...
" Plug 'vim-scripts/SyntaxComplete'

" Allegedly the best, but I'm gonna try them out one at a time...
"Plug 'yuezk/vim-js'
"Plug 'othree/yajs.vim'
"Plug 'othree/es.next.syntax.vim'

" Allegedly the best, but I'm gonna try them out one at a time...
"Plug 'othree/javascript-libraries-syntax.vim'
"let g:used_javascript_libs =
"      \ 'react,underscore,jasmine,chai,tape' 
        " jquery,handlebars,vue,d3,

" Allegedly the best, but I'm gonna try them out one at a time...
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'HerringtonDarkholme/yats.vim'

"Plug 'jxnblk/vim-mdx-js'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'elzr/vim-json'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" External Includes (they're also kill-switches)

" Tagbar <F9> and EasyTags
source ~/.config/nvim/tagbar-and-easytags.vim

" CoC Language Server Client
source ~/.config/nvim/CoC-LanguageServerClients.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A little help from tmux to know when vim is focused or not

Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux'

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
" Themes must be installed plug initialization, but they can't be activated till
" after plug has loaded every single one, I think, maybe?

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

"let g:lights_auto = 1



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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Attempts to customize my status line

"set laststatus=2
"function! StatuslineGit()
"  let l:branchname = GitBranch()
"  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction
"set statusline+=%{StatuslineGit()}

" Kill Switches for Expensive Plugins

" Easytags Kill Switch will stop the scanning of source files for tags.
" Comment this out and Easytags will scan while you are not typing
"let g:easytags_on_cursorhold = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I don't know what anthing in this section means, I just copied it from
" https://github.com/neoclide/coc.nvim along with the CoC config above.

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
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                ¯\_(ツ)_/¯
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
