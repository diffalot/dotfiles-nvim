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
  "let g:airline_theme = 'pencil'
  let g:airline_theme = 'base16_atelier_sulphurpool_light'
  " let g:material_theme_style = 'lighter'
  " colorscheme mateVrial
  " let g:airline_theme = 'material'
  " colorscheme one
  " set background=light
  "let g:airline_theme = 'silver'
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
  " let ayucolor="dark"
  " colorscheme ayu
  "
  let g:material_theme_style = 'palenight'
  colorscheme material

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

endfunction

function! __transparent()
  echomsg 'using transparent colorscheme'
  set background=dark

  " let g:tokyonight_style = "night"
  " let g:tokyonight_style = "day"
  " let g:tokyonight_style = "night"

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

  let g:tokyonight_colors = { "hint": "brightcyan", "error": "#ff0000" }

  let g:tokyonight_day_brightness = 0.75

  " Load the colorscheme
  colorscheme tokyonight
endfunction

" Oh! it's really easy to make the ui transparent and still themed :D
command! -nargs=* TranparentTheme call __transparent()
command! -nargs=* BecomeTransparent :hi! Normal ctermbg=NONE guibg=NONE <bar>
                                  \ :hi! NonText ctermbg=NONE guibg=NONE

" and it's also really easy to make comments italic!!!
command! -nargs=* ItalicizeComments :hi! Comment cterm=italic gui=italic
command! -nargs=* ItalicizeCommentsOff :hi! Comment cterm=NONE gui=NONE
augroup CustomUI
  autocmd! ColorScheme * :ItalicizeComments
augroup END

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
  call __transparent()   "           <-----------  Comment one of those out and
  "call __light()   "           <-----------  Comment one of those out and
  "call __dark()     "                         let the other set the theme
  "set background=light
  "let g:airline_theme = 'pencil'
  "set background=dark
  "let g:airline_theme = 'base16color'
  "colorscheme PaperColor
  "colorscheme pencil

  "let g:tokyonight_transparent = 0
  "let g:tokyonight_style = "night"
  "let g:tokyonight_style = "day"
  "colorscheme tokyonight
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

