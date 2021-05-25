"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My Own Vim Scripts

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
  "if exists(':TabooRename')
  "  TabooRename nvim
  "end
  augroup ZNV_Config_Reloader
    autocmd! BufWritePost <buffer> execute(g:znv_config_source_command)
  augroup END
  tabm0
endfunction

" Quick controls over displaying special characters
" tab:»\, eol:¶\,nbsp:¬\,trail:-
" and for airline conpatability add on:
" stl:\ , stlnc:\
"
set list listchars=tab:»\ ,nbsp:¬,trail:◊
command! -nargs=* CharactersOn set list listchars=stl:\ ,stlnc:\, tab:»\ ,eol:¶,nbsp:¬,trail:-
command! -nargs=* CharactersOff set list listchars=stl:\ ,stlnc:\, tab:»\ ,nbsp:¬,trail:-

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove trailing whitespace
"
command! -nargs=* WipeTrailingWhitespaces let _save_pos=getpos(".") <Bar>
      \ %s/\s\+$//e <Bar>
      \ call setpos('.', _save_pos)<Bar>
      \ unlet _save_pos<CR>

" I think it's illustrative of problems around training people how to do things
" and learning how to do new thins on your own is that beforeI saw that I
" should be thinking of the different enironments that different commands and
" variables and the user exist in and whicn ones can can cross these barriers
" and how.... anyway here's my original version that wouldn't work where I
" misunderstood where context lived and where the commands work:
"
"     command! -nargs=* WipeTrailingWhitespaces execute("%s/\s\+$//e")
"
" I want to know why this this is cleaner. Maybe mine will break something
" someday and I'll find out ;)
"
" also, is there extra value to using these unnecesary colons as the beginning
" of these commands? (I think these are all commands because a usr can run them
" in command mode, and a user has to call a function from command mode.
"
" Remap for destroying trailing whitespace cleanly
"
"     nnoremap <Leader>wwss :let _save_pos=getpos(".") <Bar>
"         \ :let _s=@/ <Bar>
"         \ :%s/\s\+$//e <Bar>
"         \ :let @/=_s <Bar>
"         \ :nohl <Bar>
"         \ :unlet _s<Bar>
"         \ :call setpos('.', _save_pos)<Bar>
"         \ :unlet _save_pos<CR><CR>
"`
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" In Progress
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO change to nearest parent project directory when opening a new tab no matter
" where the tab was created
"
"function! OnTabEnter(path)
"  if isdirectory(a:path)
"    let dirname = a:path
"  else
"    let dirname = fnamemodify(a:path, ":h")
"  endif
"  execute "tcd ". dirname
"endfunction

"autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git commit each trivial cleanup task between reorgs so they git won't ever
" give a fuck about rebasing import things since it's been well fed

"command! -nargs=* GitTrivial echo system('git commit % -m "[clean](trivial) small and dangerous"')

" todo(alice): learn about filetype autocommands
"
" keep an eye out for if
" there's a way to assign multiple filetypes to a buffer, cause that would help
" with formatting vimwiki/markdown pages
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       :help autocmd-events
" Text File Formatting
"
" https://learnvimscriptthehardway.stevelosh.com/chapters/12.html

":autocmd FileType javascript
":autocmd BufNewFile,BufRead *.html setlocal nowrap
"
" * wiki pages should trigger the lsp markdown lint and format settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here are some general theme escape hatches that you can call upon in an hour
" of need when you can't see the cursor or something else like that.

" hi Visual  guifg=LightBlue:White guibg=LightGray gui=none
" hi Visual  guifg=DarkMagenta guibg=DarkCyan gui=none

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

