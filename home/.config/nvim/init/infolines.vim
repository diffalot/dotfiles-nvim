""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
"""  Custom Status Line

" interesting CtrlSpace apis
"
" Defaults
"hi link CtrlSpaceNormal   PMenu
"hi link CtrlSpaceSelected PMenuSel
"hi link CtrlSpaceSearch   Search
"hi link CtrlSpaceStatus   StatusLine
"
"let g:CtrlSpaceStatuslineFunction = "ctrlspace#api#Statusline()"

" functions

" Provides a custom statusline string used by plugin window.
"
" ctrlspace#api#Statusline()

" Returns the info about the current tab (tab number, label, etc.). It is
" useful if you don't use the custom tabline string (or perhaps you have set
" |showtabline| to `0`
"
" ctrlspace#api#StatuslineTabSegment()

" Returns the info about the plugin mode. It can take an optional separator.
"
" ctrlspace#api#StatuslineModeSegment({...})





" from scrooloose's blog post
" https://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" via https://kadekillary.work/post/statusline-vim/
"set statusline+=%\<\                       " cut at start
"set statusline+=%=%1*%Y              " file type
"set statusline+=%10((%l,%c)%)\            " line and column
"set statusline+=%P                        " percentage of file
"``
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

function! FileSize() abort
    let l:bytes = getfsize(expand('%p'))
    if (l:bytes >= 1024)
        let l:kbytes = l:bytes / 1025
    endif
    if (exists('kbytes') && l:kbytes >= 1000)
        let l:mbytes = l:kbytes / 1000
    endif

    if l:bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return l:mbytes . 'MB '
    elseif (exists('kbytes'))
        return l:kbytes . 'KB '
    else
        return l:bytes . 'B '
    endif
endfunction

function! ReadOnly() abort
  if &readonly || !&modifiable
    return ''
  else
    return ''
  end
endfunction

let g:character_info_is_displayed=0
command! CharacterInfoToggle :let g:character_info_is_displayed = !g:character_info_is_displayed <Bar> :let &stl=&stl

function! StatusCharacterInfo() abort
  if g:character_info_is_displayed == 1
    return "\ %<\ %LL\ ❪%c,%l❫\ \\∪%B\ "
  else
    return ''
  end
endfunction

" turn off the now extra -- INSERT -- at screen bottom
set noshowmode
" Here's were thing will be prepended
set statusline=
""" PREPENDED LINES LINE UP ABOVE THIS LINE
set statusline+=%2*
"set statusline+=%M
"set statusline+=\ 
set statusline+=%1*
set statusline+=\ 
set statusline+=%M

set statusline+=%<\ %-6f
set statusline+=%=
set statusline+=%2*
set statusline+=%{%StatusCharacterInfo()%}
set statusline+=\ %{ctrlspace#api#StatuslineModeSegment()}
set statusline+=\ %{strpart(ctrlspace#api#StatuslineTabSegment(),0,4)}
set statusline+=%2*

" ctrlspace#api#StatuslineTabSegment()

" Returns the info about the plugin mode. It can take an optional separator.
"
" ctrlspace#api#StatuslineModeSegment({...})

""" These are in reverse order so that that are in correct order when they are prepended. They will be the last things to be added to the status bar so that they will end up first. An quick way to reverse the lines is to paste theminto a new buffer and then run teh command,
set statusline^=\ %1*
set statusline^=❱
set statusline^=\ %{ModeCurrent()}
set statusline^=%2*

" ANSI Colors by Number
" +------------+------+--------+
" | Color Name | Base | Bright |
" +============+======+========+
" | Black      | 0    | 8      |
" +------------+------+--------+
" | Red        | 1    | 9      |
" +------------+------+--------+
" | Green      | 2    | 10     |
" +------------+------+--------+
" | Yellow     | 3    | 11     |
" +------------+------+--------+
" | Blue       | 4    | 12     |
" +------------+------+--------+
" | Purple     | 5    | 13     |
" +------------+------+--------+
" | Cyan       | 6    | 14     |
" +------------+------+--------+
" | White      | 7    | 15     |
" +------------+------+--------+

"" Dark
"" StatusLine Highlights
"hi StatusLine
"  \ ctermfg=5
"  \ ctermbg=5
"  \ cterm=italic
"  \ guifg=LightGrey
"  \ guibg=Black
"  \ gui=none
"hi StatusLineNC
"  \ ctermfg=7
"  \ ctermbg=7
"  \ cterm=none
"  \ guifg=Grey
"  \ guibg=none
"  \ gui=none
"
"" Normal Mode
"hi User1
"  \ ctermfg=lightGrey
"  \ ctermbg=DarkGrey
"  \ cterm=italic
"  \ guifg=#c1c1c1
"  \ guibg=#585858
"  \ gui=italic
"hi User8
"  \ ctermfg=lightGrey
"  \ ctermbg=DarkGrey
"  \ cterm=bold
"  \ guifg=#aaaaaa
"  \ guibg=#3b5ea7
"  \ gui=bold
"hi User9
"  \ ctermfg=lightGrey
"  \ ctermbg=DarkGrey
"  \ cterm=bold
"  \ guifg=#aaaaaa
"  \ guibg=#3b5ea7
"  \ gui=bold

" light background
function! PersonalHighlightsLight()
  " utils
  hi User9 guibg=none guifg=darkslategray
  hi User8 guibg=none guifg=darkslategray gui=bold
  hi User7 guibg=none guifg=darkslategray gui=italic

  " selected with shaded background
  hi User1
    \ guifg=lightseagreen
    \ guibg=mintcream
    \ gui=italic

  " Mode 
  hi User2
    \ guifg=mintcream
    \ guibg=mediumturquoise
    \ gui=bold,italic

  " to switch to blue
  "hi User1 guibg=aliceblue guifg=deepskyblue
  "hi User2 guifg=aliceblue guibg=deepskyblue


  hi link CtrlSpaceNormal   User7
  hi link CtrlSpaceSelected User2
  hi link CtrlSpaceSearch   User9
  hi CtrlSpaceStatus    guifg=aliceblue guibg=deepskyblue

endfunction
"call PersonalHighlightsLight()

" light background
function! PersonalHighlightsDark()

  " utils
  "hi User9 guibg=none guifg=darkslategray
  hi User8 guibg=none guifg=darkslategray gui=bold
  hi User7 guibg=none guifg=darkslategray gui=italic

  " selected with shaded background
  hi User1
    \ guibg=dimgray
    \ guifg=mintcream
    \ gui=italic

  " Mode 
  hi User2
    \ guifg=mintcream
    \ guibg=darkcyan
    \ gui=bold,italic

  " to switch to blue
  "hi User1 guibg=aliceblue guifg=deepskyblue
  "hi User2 guifg=aliceblue guibg=deepskyblue


  "hi link CtrlSpaceNormal   User7
  hi link CtrlSpaceSelected User2
  "hi link CtrlSpaceSearch   User9
  "hi CtrlSpaceStatus    guifg=aliceblue guibg=deepskyblue

  hi StatusLineNC ctermfg=DarkGray ctermbg=grey cterm=none guibg=grey guifg=DarkGray gui=none
  hi StatusLine ctermbg=DarkGray ctermfg=grey cterm=none guifg=grey guibg=DarkGray gui=none
endfunction
call PersonalHighlightsLight()


" Light Mode Colors
"
" Medium Light Blue
"  \ guibg=#67A9D4
