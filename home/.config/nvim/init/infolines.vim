""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
"""  Custom Status Line
"""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from scrooloose's blog post
" https://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" via https://kadekillary.work/post/statusline-vim/

" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={ 'n' : 'Normal ', 'no' : 'N·Operator Pending ', 'v' : 'Visual ', 'V' : 'V·Line ', '^V' : 'V·Block ', 's' : 'Select ', 'S': 'S·Line ', '^S' : 'S·Block ', 'i' : 'Insert ', 'R' : 'Replace ', 'Rv' : 'V·Replace ', 'c' : 'Command ', 'cv' : 'Vim Ex ', 'ce' : 'Ex ', 'r' : 'Prompt ', 'rm' : 'More ', 'r?' : 'Confirm ', '!' : 'Shell ', 't' : 'Terminal '}

" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup toggles for the toolbox

let g:character_info_is_displayed=0

command! CharacterInfoToggle :let g:character_info_is_displayed = !g:character_info_is_displayed <Bar> :let &stl=&stl

function! StatusCharacterInfo() abort
  if g:character_info_is_displayed == 1
    return "\ %<\ %LL\ ❪%c,%l❫\ \\∪%B\ "
  else
    return ''
  end
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pastel is an awesome program
"
" I've found pastel to be a very handy piece of software for quiickly seeing
" what colors look like together in the terminal.  It's got some good math
" tools for doing math with colors in a variety of colorspaces, adn I should
" look up what these mean:  between colors in a variety os
" [default: Lab] [possible values: Lab, LCh, RGB, HSL]
"
" home/.config/nvim on  💻 [$!] via 🌙 on ☁️ 
" ➜ pastel color darkslategray mediumturquoise
"
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  Name: darkslategray
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  Hex: #2f4f4f
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  RGB: rgb(47, 79, 79)
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  HSL: hsl(180, 25.4%, 24.7%)
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  Most similar:
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀ dimgray
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀ teal
" 
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  Name: mediumturquoise
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  Hex: #48d1cc
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  RGB: rgb(72, 209, 204)
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  HSL: hsl(178, 59.8%, 55.1%)
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  Most similar:
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀ darkturquoise
"   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀ turquoise

" TODO I may need to make these functions part of the themes.functions.vim or 
" maybe not...  It's not like they will be useful for other parts of a text
" editor,

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""           
" Start Puttting the pieces together

" turn off that extra `INSERT` -- at screen bottom
set noshowmode

set statusline=
""" PREPENDED LINES LINE UP ABOVE THIS LINE
set statusline+=%2*
"set statusline+=%M
"set statusline+=\ 
set statusline+=%1*
set statusline+=\ %M
set statusline+=%<\ %-f
set statusline+=%=
set statusline+=%2*
set statusline+=%{%StatusCharacterInfo()%}
"set statusline+=\ %{ctrlspace#api#StatuslineModeSegment()}
set statusline+=\ %{ctrlspace#api#StatuslineTabSegment()}
set statusline+=\ %2*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These are in reverse order so that that are in correct order when they are 
" prepended. They will be the last things to be added to the status bar so that
" they will end up first. An quick way to reverse the lines is to paste them
" into a new buffer (because I don't know how to select ranges yet. And then 
" run the command, `:%!tac` on them.

set statusline^=\ %1*
set statusline^=❱
set statusline^=\ %{ModeCurrent()}
set statusline^=%2*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Color Assignment Functions
"
" we'll use a minimimal number of highlight groups and change colors on 
" them as modes switch???
"
" There's a big char at the bottom of the file, but it doesn't have enough
" colors in it yet to be fun
" 
" But here's a switch to a blue switch to blue
" hi User1 guibg=aliceblue guifg=deepskyblue
" hi User2 guifg=aliceblue guibg=deepskyblue

"""""""""""""""""""""""""""""""""""""""""
" Light Background
function! PersonalHighlightsLight()

  " Normal Menu Item Text 
  hi User1
    \ guifg=lightseagreen
    \ guibg=mintcream
    \ gui=italic

  " Mode Indicator
  " Selected Menu Text
  hi User2
    \ guifg=mintcream
    \ guibg=mediumturquoise
    \ gui=bold,italic

  " Copies from Menu Items,
  " does not have good shoes 
  hi CtrlSpaceStatus
    \ guifg=lightseagreen
    \ guibg=mintcream
    \ gui=none
  
  " Copies from Menu Items
  " Already has a blister
  hi CtrlSpaceSelected
    \ guifg=lightseagreen
    \ guibg=mintcream
    \ gui=bold,italic

  hi StatusLineNC ctermfg=LightGra ctermbg=grey cterm=bold guibg=grey guifg=DarkGray gui=reverse
  hi StatusLine ctermbg=DarkGray ctermfg=white cterm=none guifg=grey guibg=LightGrey gui=none
endfunction


"""""""""""""""""""""""""""""""""""""""""
" Dark background                  " 
function! PersonalHighlightsDark() " 
                                  " +-------+---+----+-----------------------------+------------------------+--+--+
  " Normal Menu Text              " | Green | 2 | 10 | darkslategray               | mediumturquoise        |  |  |
  hi User1                        " |       |   |    | #2f4f4f                     | #48d1cc                |  |  |
    \ guifg=#a2ada9               " |       |   |    | RGB: rgb(47, 79, 79)        | rgb(72, 209, 204)      |  |  |
    \ guibg=none                  " |       |   |    | HSL: hsl(180, 25.4%, 24.7%) | hsl(178, 59.8%, 55.1%) |  |  |
    \ gui=italic                  " +-------+---+----+-----------------------------+------------------------+--+--+
                                  " Notsure if these are part of the final color scheme or
                                  " if there will ever be a final come
  " Mode Indicator
  " Selected Menu Text
  hi User2
    \ guifg=#a2ada9
    \ guibg=#436160
    \ gui=bold,italic

  hi CtrlSpaceNormal
    \ guifg=#a2ada9
    \ guibg=dimgray
    \ gui=italic

  hi TabLineSel
    \ guifg=#a2ada9
    \ guibg=#436160
    \ gui=bold,italic

  hi TabLineFill
    \ guifg=#black
    \ guibg=dimgray
    \ gui=italic

  hi VertSplit
    \ guifg=#a2ada9
    \ guibg=none
  "hi link CtrlSpaceSelected User2
  "hi link CtrlSpaceSearch   User9
  hi CtrlSpaceStatus guibg=#DarkGrey guifg=#grey

  hi StatusLineNC  guibg=darkgrey guifg=none gui=bold
  hi StatusLine  guifg=none guibg=Gray gui=italic
endfunction

"""""""""""""""""""""""""""""""""""""""""
" We'll eventually be able to combine those light and dark functions into one
" that will take care of all the needed outfit changes a proper terminal needs
" for a night out.
"
" TODO watch for theme changes with an auto command and then load the appropriate highlights

function! PersonalHighlights() abort
  if &background == "light"
    call PersonalHighlightsLight()
  else
    call PersonalHighlightsDark()
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Color Chart
"
" Here are the colors we want to use, well, eventually.  It might be fun to
" play with the text object model with these to do some very accurate math
" with colors.
" 

" ANSI Colors by Number
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" | Color Name | Base | Bright | Theme                       | Theme                     | Chord  |    |
" |            |      |        | Base                        | Bright                    | Colors |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" | Black      | 0    | 8      |                             |                           |        |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" | Red        | 1    | 9      |                             |                           |        |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" | Green      | 2    | 10     | darkslategray               | mediumturquoise           |        |    |
" |            |      |        | #2f4f4f                     | #48d1cc                   |        |    |
" |            |      |        | RGB: rgb(47, 79, 79)        | rgb(72, 209, 204)         |        |    |
" |            |      |        | HSL: hsl(180, 25.4%, 24.7%) | hsl(178, 59.8%, 55.1%)    |        |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" | Yellow     | 3    | 11     |                             |                           |        |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" | Blue       | 4    | 12     |                             |                           |        |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" | Purple     | 5    | 13     |                             |                           |        |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" | Cyan       | 6    | 14     |                             |                           |        |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" | White      | 7    | 15     |                             |                           |        |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
" |            |      |        |                             |                           |        |    |
" +------------+------+--------+-----------------------------+---------------------------+--------+----+
