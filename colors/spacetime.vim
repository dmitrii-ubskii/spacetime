" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "spacetime"

" }}}
" Palette {{{

let s:spc = {}

let s:spc.plain = ['#f8f6f2', 15]
let s:spc.snow = ['#ffffff', 15]

" All of the Gravel colors are based on a brown from Clouds Midnight.
let s:spc.brightgravel = ['#d9cec3', 252]
let s:spc.lightgravel = ['#998f84', 245]
let s:spc.gravel = ['#857f78', 243]
let s:spc.mediumgravel = ['#666462', 241]
let s:spc.deepgravel = ['#45413b', 238]
let s:spc.deepergravel = ['#35322d', 236]
let s:spc.darkgravel = ['#242321', 235]
let s:spc.blackgravel = ['#1c1b1a', 233]
let s:spc.blackestgravel = ['#121212', 232]

let s:spc.vanta = ['#080808', 232]

let s:spc.danger = ['#5f0000', 52]
let s:spc.maroon = ['#870000', 88]
let s:spc.olive = ['#afaf00', 142]

" ---------------------------------------------------

" Beautiful blue that sold me on Bad Wolf
let s:spc.tardis = ['#0a9dff', 39]

let s:spc.dalespale = ['#fade3e', 221]
let s:spc.dirtyblonde = ['#f4cf86', 222]
let s:spc.taffy = ['#ff2c4b', 196]
let s:spc.saltwatertaffy = ['#8cffba', 121]
let s:spc.orange = ['#ffa724', 214]
let s:spc.lime = ['#aeee00', 154]
let s:spc.dress = ['#ff9eb8', 211]
let s:spc.toffee = ['#b88853', 137]
let s:spc.coffee = ['#c7915b', 173]
let s:spc.darkroast = ['#88633f', 95]

" }}}

" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

     let histring = 'hi ' . a:group . ' '

     if strlen(a:fg)
         if a:fg == 'fg'
             let histring .= 'guifg=fg ctermfg=fg '
         else
             let c = get(s:spc, a:fg)
             let histring .= 'guifg=' . c[0] . ' ctermfg=' . c[1] . ' '
         endif
     endif

     if a:0 >= 1 && strlen(a:1)
         if a:1 == 'bg'
             let histring .= 'guibg=bg ctermbg=bg '
         else
             let c = get(s:spc, a:1)
             let histring .= 'guibg=' . c[0] . ' ctermbg=' . c[1] . ' '
         endif
     endif

     if a:0 >= 2 && strlen(a:2)
         let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
     endif

     if a:0 >= 3 && strlen(a:3)
         let c = get(s:spc, a:3)
         let histring .= 'guisp=' . c[0] . ' '
     endif

     execute histring
endfunction
" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla (Neo)Vim {{{

" General/UI {{{
call s:HL('Normal', 'plain', 'vanta', 'none')
call s:HL('NormalFloat', 'plain', 'blackgravel', 'none')

call s:HL('NonText', 'mediumgravel', 'bg', 'none')
hi! link SpecialKey NonText
hi! link Whitespace NonText
hi! link Folded NonText

hi! link CursorLine LineNr
hi! link CursorColumn CursorLine
hi! link ColorColumn CursorLine

call s:HL('WinSeparator', 'gravel', 'bg', 'none')

call s:HL('TabLine', 'plain', 'blackgravel', 'none')
hi! link TabLineFill TabLine
call s:HL('TabLineSel', 'vanta', 'tardis', 'none')

call s:HL('MatchParen', 'dress', 'bg', 'none')

call s:HL('Visual', 'plain', 'deepgravel', 'none')
hi! link VisualNOS Visual

call s:HL('Search', 'vanta', 'dalespale', 'none')
call s:HL('IncSearch', 'vanta', 'tardis', 'none')

call s:HL('StatusLine', 'vanta', 'tardis', 'none')
call s:HL('StatusLineNC', 'snow', 'deepgravel', 'none')
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC

call s:HL('Directory', 'dirtyblonde', '', 'none')

call s:HL('Title', 'lime', '', 'none')

call s:HL('ErrorMsg', 'taffy', 'bg', 'none')
call s:HL('ModeMsg', 'dirtyblonde', '', 'none')
call s:HL('WarningMsg', 'dress', '', 'none')
call s:HL('MoreMsg', 'dirtyblonde', '', 'none')
hi! link Question MoreMsg
" }}}

" Gutter {{{
call s:HL('LineNr', 'gravel', 'blackestgravel', 'none')
hi! link CursorLineNr LineNr

hi! link SignColumn LineNr
hi! link FoldColumn LineNr
" }}}

" Cursor {{{
call s:HL('Cursor', 'vanta', 'tardis', 'none')
hi! link lCursor Cursor
" }}}

" Syntax highlighting {{{
call s:HL('Special', 'plain', '', 'none')

call s:HL('Todo', 'snow', 'danger', 'none')
call s:HL('Comment', 'gravel', '', 'none')

call s:HL('Constant', 'toffee', '', 'none')
call s:HL('String', 'dirtyblonde', '', 'none')

call s:HL('Statement', 'taffy', '', 'none')

call s:HL('Identifier', 'orange', '', 'none')

call s:HL('PreProc', 'lime', '', 'none')

call s:HL('Type', 'dress', '', 'none')

call s:HL('Error', 'snow', 'taffy', 'none')
" }}}

" Completion Menu {{{
call s:HL('Pmenu', 'plain', 'deepergravel', 'none')
call s:HL('PmenuSel', 'vanta', 'tardis', 'none')
call s:HL('PmenuSbar', '', 'deepergravel', 'none')
call s:HL('PmenuThumb', '', 'brightgravel', 'none')
call s:HL('PmenuMatch', 'saltwatertaffy', 'deepergravel', 'none')
call s:HL('PmenuMatchSel', 'vanta', 'tardis', 'none')
hi! link WildMenu PmenuSel
" }}}

" Diffs {{{
call s:HL('DiffDelete', 'dress', 'vanta')
call s:HL('DiffAdd', 'snow', 'deepergravel')
call s:HL('DiffChange', '', 'blackgravel') " text on a line with changes
call s:HL('DiffText', 'olive', 'blackgravel') " actual changes

call s:HL('gitDiff', 'lightgravel', '',)

call s:HL('diffRemoved', 'dress', '', 'none')
call s:HL('diffAdded', 'lime', '', 'none')
call s:HL('diffFile', 'vanta', 'taffy', 'none')
call s:HL('diffNewFile', 'vanta', 'taffy', 'none')

call s:HL('diffLine', 'vanta', 'orange')
call s:HL('diffSubname', 'orange', '', 'none')
" }}}

call s:HL('QuickFixLine', 'vanta', 'brightgravel', 'none')


call s:HL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
call s:HL('SpellBad', '', 'bg', 'undercurl', 'dress')
call s:HL('SpellLocal', '', '', 'none')
call s:HL('SpellRare', '', '', 'none')

call s:HL('Conceal', 'blackestgravel', 'gravel', 'none')
call s:HL('Ignore', 'gravel', '', 'none')
" }}}

" Plugins {{{
" Signify {{{
call s:HL('SignifySignAdd', 'lime', 'blackestgravel')
call s:HL('SignifySignChange', 'orange', 'blackestgravel')
call s:HL('SignifySignDelete', 'taffy', 'blackestgravel')
" }}}
" }}}

" vim:foldmethod=marker:foldlevel=0
