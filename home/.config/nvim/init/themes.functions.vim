"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"  Cool Colors and light/dark switching functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LightsSwitch, LightsOff, and LightsOn functions to switch between dark and
" light modes at dusk and dawn (not accurately), or on demand.

command! -nargs=* LightsOn call __light()
command! -nargs=* LightsOff call __dark()
command! -nargs=* LightsAuto call __auto()

" Oh! it's really easy to make the ui transparent and still themed :D
command! -nargs=* TranparentTheme call __transparent()
command! -nargs=* BecomeTransparent :hi! Normal ctermbg=NONE guibg=NONE <bar>
                                  \ :hi! NonText ctermbg=NONE guibg=NONE

" and it's also really easy to make comments italic!!!
command! -nargs=* ItalicizeComments :hi! Comment cterm=italic gui=italic
command! -nargs=* ItalicizeCommentsOff :hi! Comment cterm=NONE gui=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LightsSwitch, LightsOff, and LightsOn functions to switch between dark and
" light modes at dusk and dawn (not accurately), or on demand.

command! -nargs=* LightsOn call __light()
command! -nargs=* LightsOff call __dark()
command! -nargs=* LightsAuto call __auto()

" Oh! it's really easy to make the ui transparent and still themed :D
command! -nargs=* TranparentTheme call __transparent()
command! -nargs=* BecomeTransparent :hi! Normal ctermbg=NONE guibg=NONE <bar>
                                  \ :hi! NonText ctermbg=NONE guibg=NONE

" and it's also really easy to make comments italic!!!
command! -nargs=* ItalicizeComments :hi! Comment cterm=italic gui=italic
command! -nargs=* ItalicizeCommentsOff :hi! Comment cterm=NONE gui=NONE

" I want italics everywhere!!!
augroup CustomUI
  autocmd! ColorScheme * :ItalicizeComments
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" timed theme switching (auto mode) setup
" it will default to dark mode if it is zero or unset
" TODO make auto variable accept dark, light, and transparent as strings in
" addition? to 0 and 1
" force a single mode with a word
" 1 or auto is auto timer mode
" 0 is default to dark, or maybe dont do anything??
" this gets reset to 0 on mobile (dark mode)

let g:lights_auto = 1    "    <------ Set the auto mode on or off right here

"" `echo winwidth('%')` reports 61 on the phone
"if winwidth('%') < 70
"  let g:lights_auto = 0
"end

function! __light()
  "echomsg 'using light colorscheme'
  set background=light

  " set vars for light mode themes
  let g:material_theme_style = 'lighter'
  let g:tokyonight_style = "day"
  let g:tokyonight_transparent = 0
  let g:tokyonight_day_brightness = 0.8
  let ayucolor="light"
  " let ayucolor="mirage"

  " set color
  " colorscheme PaperColor
  colorscheme pencil
  " colorscheme material

  " bug in one requires backgroud to be set after setting colorscheme
  " colorscheme one
  " set background=light

  " set light mode airline
  " let g:airline_theme = 'pencil'
  let g:airline_theme = 'base16_atelier_sulphurpool_light'
  " let g:airline_theme = 'material'
  " let g:airline_theme = 'silver'
endfunction
"    ^       Pick fonts
"    |       In Either of these
"    |-------------------------
"    |       Functions :)
"    v
function! __dark()
  "echomsg 'using dark colorscheme'
  set background=dark

  " set up preferred dark modes for themes
  let g:material_theme_style = 'palenight'
  let ayucolor="dark"
  " let ayucolor="mirage"
  let g:tokyonight_style = "night"
  let g:tokyonight_transparent = 0
  let g:neodark#terminal_transparent = 0

  " colorscheme orange-moon
  " colorscheme yellow-moon
  " colorscheme ayu
  " colorscheme neodark
  " colorscheme rigel
  " colorscheme pencil

  colorscheme lucius
  LuciusDark

  " bug in one requires setting background after theme
  " colorscheme one
  " set background=dark

  " setup airline for dark mode
  let g:airline_theme = 'pencil'
  " let g:airline_theme = 'base16color'
  " let g:airline_theme = 'understated'
  " let g:airline_theme = 'serene'
  " let g:airline_theme = 'bubblegum'
endfunction

function! __transparent()
  echomsg 'using transparent colorscheme'

  let g:neodark#terminal_transparent = 1
  let g:tokyonight_transparent = 1
  let ayucolor="mirage"
  " let ayucolor="light"
  " let ayucolor="dark"

  set background=dark
  let g:tokyonight_style = "night"
  " let g:tokyonight_style = "storm"
  let g:tokyonight_day_brightness = 0.75
  let g:tokyonight_colors = { "hint": "brightcyan", "error": "#ff0000" }

  "set background=light
  "let g:tokyonight_style = "day"
  "" let g:tokyonight_style = "storm"
  "let g:tokyonight_day_brightness = 0.75
  "let g:tokyonight_colors = { "hint": "brightcyan", "error": "#ff0000" }

  " Load the colorscheme
  colorscheme tokyonight

  " setup airline for dark mode
  let g:airline_theme = 'pencil'
  " let g:airline_theme = 'base16color'
  " let g:airline_theme = 'understated'
  " let g:airline_theme = 'serene'
  " let g:airline_theme = 'bubblegum'

  " set light mode airline
  " let g:airline_theme = 'pencil'
  let g:airline_theme = 'base16_atelier_sulphurpool_light'
  " let g:airline_theme = 'material'
  " let g:airline_theme = 'silver'
endfunction

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
  "echomsg 'using timed colorscheme'
  call __auto()
else
  echomsg 'timed theme switching inactive'
  call __dark()     "                         let the other set the theme
endif
