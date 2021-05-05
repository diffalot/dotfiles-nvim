"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plug 'preservim/tagbar'
" brew install ctags-exuberant
" npm install -g git+https://github.com/ramitos/jsctags.git
" more at https://github.com/preservim/tagbar/wiki
nmap <F9> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plug 'xolox/vim-easytags'
"Plug 'xolox/vim-misc'
" if I understand the the instructions:
" brew install --HEAD universal-ctags/universal-ctags/universal-ctags
" that will reqire replacing ctags-exuberant
" then you have to go into the plugged foder and compile these two???
"
" Commands - https://github.com/xolox/vim-easytags#commands
"
" `:UpdateTags` updates tags starting from the active buffer and to `:UpdateTags
" <args>` is essentially running `ctags <args>`
" `:UpdateTags!` prunes the global list of tags that realate to files that are
" no longer present
" `:HighlightTags` highlights all tags known to easytags in the current buffer
" and runs continually when you are afk and not typing are run atomatically
" (when `g:easytags_on_cursorhold` is false)
" 
" tag files are stored at `~/.vim/tags`
"
" The following options may be uncommented to reduce easytag's veracity in
" consuming all computer resources
"
" e.g. don't process python files
" autocmd FileType python let b:easytags_auto_highlight = 0`
" let g:easytags_syntax_keyword = 'always'
"
" Languages have been added farther down in this file in the 
" "Universal CTags Language Settings" section and should probably be move out
" to their own file
"
" let g:easytags_on_cursorhold = 1 " this means it will stop scanning for tags
" ^ That will stop the scanning of source files for tags. It is set at the top of the main init.vim file so it is easily accessible as a kill-switch.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Universal CTags Language Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

let g:tagbar_type_json = {
    \ 'ctagstype' : 'json',
    \ 'kinds' : [
      \ 'o:objects',
      \ 'a:arrays',
      \ 'n:numbers',
      \ 's:strings',
      \ 'b:booleans',
      \ 'z:nulls'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
    \ 'object': 'o',
      \ 'array': 'a',
      \ 'number': 'n',
      \ 'string': 's',
      \ 'boolean': 'b',
      \ 'null': 'z'
    \ },
    \ 'kind2scope': {
    \ 'o': 'object',
      \ 'a': 'array',
      \ 'n': 'number',
      \ 's': 'string',
      \ 'b': 'boolean',
      \ 'z': 'null'
    \ },
    \ 'sort' : 0
    \ }

let g:tagbar_type_markdown = {
  \ 'ctagstype'	: 'markdown',
  \ 'kinds'		: [
    \ 'c:chapter:0:1',
    \ 's:section:0:1',
    \ 'S:subsection:0:1',
    \ 't:subsubsection:0:1',
    \ 'T:l4subsection:0:1',
    \ 'u:l5subsection:0:1',
  \ ],
  \ 'sro'			: '""',
  \ 'kind2scope'	: {
    \ 'c' : 'chapter',
    \ 's' : 'section',
    \ 'S' : 'subsection',
    \ 't' : 'subsubsection',
    \ 'T' : 'l4subsection',
  \ },
  \ 'scope2kind'	: {
    \ 'chapter' : 'c',
    \ 'section' : 's',
    \ 'subsection' : 'S',
    \ 'subsubsection' : 't',
    \ 'l4subsection' : 'T',
  \ },
\ }

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
