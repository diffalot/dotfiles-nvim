if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif
" e.g. using 'd' instead of 'days' to save some space.
if !exists('g:undotree_ShortIndicators')
    let g:undotree_ShortIndicators = 1
endif
" undotree window width
if !exists('g:undotree_SplitWidth')
    if g:undotree_ShortIndicators == 1
        let g:undotree_SplitWidth = 32
    else
        let g:undotree_SplitWidth = 36
    endif
endif
" diff window height
if !exists('g:undotree_DiffpanelHeight')
    let g:undotree_DiffpanelHeight = 18
endif
" auto open diff window
if !exists('g:undotree_DiffAutoOpen')
    let g:undotree_DiffAutoOpen = 1
endif
" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif
if !exists('g:undotree_DiffCommand')
    let g:undotree_DiffCommand = "diff"
endif
" relative timestamp
if !exists('g:undotree_RelativeTimestamp')
    let g:undotree_RelativeTimestamp = 1
endif
" Highlight changed text
if !exists('g:undotree_HighlightChangedText')
    let g:undotree_HighlightChangedText = 1
endif

" Highlight changed text using signs in the gutter
if !exists('g:undotree_HighlightChangedWithSign')
    let g:undotree_HighlightChangedWithSign = 1
endif
" Highlight linked syntax type.
" You may chose your favorite through ":hi" command
if !exists('g:undotree_HighlightSyntaxAdd')
    let g:undotree_HighlightSyntaxAdd = "DiffAdd"
endif
if !exists('g:undotree_HighlightSyntaxChange')
    let g:undotree_HighlightSyntaxChange = "DiffChange"
endif
if !exists('g:undotree_HighlightSyntaxDel')
    let g:undotree_HighlightSyntaxDel = "DiffDelete"
endif
" Show help line
if !exists('g:undotree_HelpLine')
    let g:undotree_HelpLine = 0
endif
" Show cursorline
if !exists('g:undotree_CursorLine')
    let g:undotree_CursorLine = 1
endif
