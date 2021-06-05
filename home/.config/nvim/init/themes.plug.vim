"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Color Themes
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes must be installed during plug initialization, but they can't be
" activated till after plug has loaded every single one, I think, maybe?

" there are soooo many in here i have to turn them off sometimes
"Plug 'chriskempson/base16-vi
" colorscheme PaperColor
" no dark mode
Plug 'NLKNguyen/papercolor-theme'

" colorscheme pencil
Plug 'preservim/vim-colors-pencil'
let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
let g:pencil_neutral_code_bg = 0   " 0=gray (def), 1=normal
let g:pencil_gutter_color = 1      " 0=mono (def), 1=color
let g:pencil_spell_undercurl = 1       " 0=underline, 1=undercurl (def)
let g:pencil_terminal_italics = 1

" colorscheme tokyonight
Plug 'folke/tokyonight.nvim'
let g:tokyonight_terminal_colors = 1
let g:tokyonight_italic_comments = 1
let g:tokyonight_italic_keywords = 1
let g:tokyonight_italic_variables = 0
let g:tokyonight_italic_functions = 0
let g:tokyonight_hide_inactive_statusline = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
let g:tokyonight_dark_sidebar = 1
let g:tokyonight_dark_float = 1
" handled in day/night functions
" let g:tokyonight_transparent = 0
" let g:tokyonight_style = "night"
" let g:tokyonight_style = "day"
" let g:tokyonight_style = "storm"

" colorscheme ayu
"Plug 'ayu-theme/ayu-vim'
"Plug 'ayu-theme/ayu-vim-airline'
" handled in auto functions
" let ayucolor="dark"
" let ayucolor="mirage"
" let ayucolor="light"

" TODO look up options
Plug 'jonathanfilip/vim-lucius'

" colorscheme one
Plug 'rakr/vim-one'
let g:one_allow_italics = 1
" set in auto functions
" TODO confirm: bug requires setting background after theme
" set background=dark
" set background=light

" colorscheme material
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
let g:material_terminal_italics = 1
" handled in auto functions
" TODO look up all the options
" let g:material_theme_style = 'lighter'

" colorscheme rigel
" dark only
Plug 'Rigellute/rigel'

" colorscheme wildcherry
Plug 'sliminality/wild-cherry-vim'

" colorscheme onedark
" dark only
Plug 'joshdick/onedark.vim'
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
"let g:onedark_termcolors=16
let g:onedark_terminal_italics=1

" colorscheme neodark
" dark only
Plug 'KeitaNakamura/neodark.vim'
let g:neodark#use_256color = 1
let g:neodark#background = '#202020'
" handled in auto functions
" let g:neodark#terminal_transparent = 1

" colorscheme orange-moon
" colorscheme yellow-moon
" dark only
Plug 'sts10/vim-pink-moon'

" I'd forgotten about these
Plug 'dikiaap/minimalist'
Plug 'Lokaltog/vim-distinguished'

" Incoming
"
" with help files ???
" https://github.com/sainnhe/everforest
Plug 'sainnhe/everforest'


" specializing in good syntax highlighting
Plug 'connorholyday/vim-snazzy'


Plug 'jaredgorski/SpaceCamp'
Plug 'aswathkk/DarkScene.vim'
Plug 'challenger-deep-theme/vim'
Plug 'zeis/vim-kolor'
Plug 'tssm/fairyfloss.vim'
Plug 'TroyFletcher/vim-colors-synthwave'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"The following are configured in infolines.vim for sync in color, etc.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'sainnhe/edge'

" I'm thinking about working
" with these
Plug '$HOME/Desktop/vim-dim'
Plug '$HOME/Desktop/ayu-vim'

" this is a theme factory :D
" https://github.com/rktjmp/lush.nvim
Plug 'rktjmp/lush.nvim'

Plug 'savq/melange'
Plug '$HOME/Desktop/cromo'
