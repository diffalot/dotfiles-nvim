"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"    User Interface Improvements for Code
"
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
let g:rbpt_loadcmd_toggle = 1

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
"let g:auto_session_root_dir = $HOME . '.config/nvim/sessions'
let g:auto_session_enable_last_session = 0
let g:auto_session_enabled = 0
let g:auto_save_enabled = 0
let g:auto_restore_enabled = 0
let g:auto_session_suppress_dirs = ['~/Desktop']

"this viewer doesn't work without telescope
"Plug 'rmagatti/session-lens'

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
" A little help from tmux to know when vim is focused or not
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux'

