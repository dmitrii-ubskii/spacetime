" Supporting code -------------------------------------------------------------
" Preamble {{{
if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark
source $VIMRUNTIME/colors/vim.lua " Nvim: revert to Vim default color scheme

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "spacetime"
" }}}

" Palette {{{

let s:spc = {}

" Cosmic latte
let s:spc.latte = ['#fff8e7', 15]

let s:spc.snow = ['#ffffff', 15]

let s:spc.brightnebula = ['#e7e7ed', 252]
let s:spc.lightnebula = ['#9a98b2', 245]
let s:spc.nebula = ['#8280a0', 243]
let s:spc.mediumnebula = ['#605e7e', 241]
let s:spc.deepnebula = ['#48465e', 238]
let s:spc.deepernebula = ['#3c3b4e', 236]
let s:spc.darknebula = ['#24232f', 235]
let s:spc.blacknebula = ['#1e1d27', 233]
let s:spc.blackestnebula = ['#121116', 232]

let s:spc.void = ['#080808', 232]

let s:spc.danger = ['#5f0000', 52]
let s:spc.maroon = ['#870000', 88]
let s:spc.olive = ['#afaf00', 142]

" ---------------------------------------------------

" Beautiful blue that sold me on Bad Wolf
let s:spc.tardis = ['#0a9dff', 39]

let s:spc.radiance = ['#fade3e', 221]
let s:spc.arrakis = ['#fdc676', 222]

let s:spc.redshift = ['#ff320a', 196]
let s:spc.uranus = ['#7df9ff', 121]
let s:spc.flare = ['#ffbb22', 214]
let s:spc.gamma = ['#8efe00', 154]
let s:spc.rosette = ['#ffa5d1', 211]
let s:spc.mars = ['#bb7a56', 137]
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
call s:HL('Normal', 'latte', 'void', 'none')
call s:HL('NormalFloat', 'latte', 'blacknebula', 'none')

call s:HL('NonText', 'mediumnebula', 'bg', 'none')
hi! link SpecialKey NonText
hi! link Whitespace NonText
hi! link Folded NonText

call s:HL('CursorLine', '', 'deepernebula', 'none')
hi! link CursorColumn CursorLine
hi! link ColorColumn CursorLine

call s:HL('WinSeparator', 'nebula', 'bg', 'none')

call s:HL('TabLine', 'latte', 'blacknebula', 'none')
hi! link TabLineFill TabLine
call s:HL('TabLineSel', 'void', 'tardis', 'none')

call s:HL('MatchParen', 'rosette', 'bg', 'none')

call s:HL('Visual', 'latte', 'deepnebula', 'none')
hi! link VisualNOS Visual

call s:HL('Search', 'void', 'radiance', 'none')
call s:HL('IncSearch', 'void', 'tardis', 'none')

call s:HL('StatusLine', 'void', 'tardis', 'bold')
call s:HL('StatusLineNC', 'snow', 'deepnebula', 'bold')
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC

call s:HL('Directory', 'arrakis', '', 'none')

call s:HL('Title', 'gamma', '', 'none')

call s:HL('ErrorMsg', 'redshift', 'bg', 'none')
call s:HL('ModeMsg', 'arrakis', '', 'none')
call s:HL('WarningMsg', 'rosette', '', 'none')
call s:HL('MoreMsg', 'arrakis', '', 'none')
hi! link Question MoreMsg
" }}}

" Gutter {{{
call s:HL('LineNr', 'nebula', 'blackestnebula', 'none')
hi! link CursorLineNr LineNr

hi! link SignColumn LineNr
hi! link FoldColumn LineNr
" }}}

" Cursor {{{
call s:HL('Cursor', 'void', 'tardis', 'none')
hi! link lCursor Cursor
" }}}

" Syntax highlighting {{{
call s:HL('Special', 'latte', '', 'none')

call s:HL('Todo', 'snow', 'danger', 'none')
call s:HL('Comment', 'nebula', '', 'none')

call s:HL('Constant', 'mars', '', 'none')
call s:HL('String', 'arrakis', '', 'none')

call s:HL('Statement', 'redshift', '', 'none')

call s:HL('Identifier', 'flare', '', 'none')

call s:HL('PreProc', 'gamma', '', 'none')

call s:HL('Type', 'rosette', '', 'none')

call s:HL('Error', 'snow', 'redshift', 'none')

call s:HL('DiagnosticError', 'redshift', '', 'none')
call s:HL('DiagnosticWarn', 'flare', '', 'none')
call s:HL('DiagnosticInfo', 'uranus', '', 'none')
call s:HL('DiagnosticHint', 'brightnebula', '', 'none')

call s:HL('DiagnosticDeprecated', 'brightnebula', '')

call s:HL('DiagnosticUnderlineError', '', 'danger', 'none')
hi DiagnosticUnderlineHint cterm=none gui=none
" }}}

" Completion Menu {{{
call s:HL('Pmenu', 'latte', 'deepernebula', 'none')
call s:HL('PmenuSel', 'void', 'tardis', 'none')
call s:HL('PmenuSbar', '', 'deepernebula', 'none')
call s:HL('PmenuThumb', '', 'brightnebula', 'none')
call s:HL('PmenuMatch', 'uranus', 'deepernebula', 'none')
call s:HL('PmenuMatchSel', 'void', 'tardis', 'none')
hi! link WildMenu PmenuSel
" }}}

" Diffs {{{
call s:HL('DiffDelete', 'rosette', 'void')
call s:HL('DiffAdd', 'snow', 'deepernebula')
call s:HL('DiffChange', '', 'blacknebula') " text on a line with changes
call s:HL('DiffText', 'olive', 'blacknebula') " actual changes

call s:HL('gitDiff', 'lightnebula', '',)

call s:HL('diffRemoved', 'rosette', '', 'none')
call s:HL('diffAdded', 'gamma', '', 'none')
call s:HL('diffFile', 'void', 'redshift', 'none')
call s:HL('diffNewFile', 'void', 'redshift', 'none')

call s:HL('diffLine', 'void', 'flare')
call s:HL('diffSubname', 'flare', '', 'none')
" }}}

call s:HL('QuickFixLine', 'void', 'brightnebula', 'none')

call s:HL('SpellCap', 'radiance', 'bg', 'undercurl,bold', 'dalespale')
call s:HL('SpellBad', '', 'bg', 'undercurl', 'rosette')
call s:HL('SpellLocal', '', '', 'none')
call s:HL('SpellRare', '', '', 'none')

call s:HL('Conceal', 'blackestnebula', 'nebula', 'none')
call s:HL('Ignore', 'nebula', '', 'none')
" }}}

" Plugins {{{
" Signify {{{
call s:HL('SignifySignAdd', 'gamma', 'blackestnebula')
call s:HL('SignifySignChange', 'flare', 'blackestnebula')
call s:HL('SignifySignDelete', 'redshift', 'blackestnebula')
" }}}

" Treesitter {{{
hi! link @keyword.type Keyword
" }}}
" }}}

" vim:foldmethod=marker:foldlevel=0
