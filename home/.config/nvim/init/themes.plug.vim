"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line and Icons
" I would love a single status line on tmux, please
"Plug 'narajaon/onestatus'
"Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
"Plug 'hoob3rt/lualine.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" let g:airline_theme = 'pencil'

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
Plug 'chriskempson/base16-vim'

