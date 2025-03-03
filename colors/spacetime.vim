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

call s:HL('Normal', 'plain', 'vanta')
call s:HL('NormalFloat', 'plain', 'blackgravel')

call s:HL('NonText', 'deepgravel', 'bg')
hi! link SpecialKey NonText
" listchars
hi! link Whitespace NonText

call s:HL('CursorLine', '', 'blackestgravel', 'none')
hi! link CursorColumn CursorLine
hi! link ColorColumn CursorLine

call s:HL('Folded', 'mediumgravel', 'bg', 'none')

call s:HL('VertSplit', 'lightgravel', 'bg', 'none')

call s:HL('TabLine', 'plain', 'blackgravel', 'none')
hi! link TabLineFill TabLine
call s:HL('TabLineSel', 'vanta', 'tardis', 'none')

call s:HL('MatchParen', 'dress', 'bg', 'none')

call s:HL('Visual', '', 'deepgravel')
hi! link VisualNOS Visual

call s:HL('Search', 'vanta', 'dalespale', 'none')
call s:HL('IncSearch', 'vanta', 'tardis', 'none')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine', 'vanta', 'tardis', 'bold')
call s:HL('StatusLineNC', 'snow', 'deepgravel', 'bold')

call s:HL('Directory', 'dirtyblonde', '')

call s:HL('Title', 'lime')

call s:HL('ErrorMsg', 'taffy', 'bg')
call s:HL('MoreMsg', 'dirtyblonde', '')
call s:HL('ModeMsg', 'dirtyblonde', '')
call s:HL('Question', 'dirtyblonde', '')
call s:HL('WarningMsg', 'dress', '')

" }}}
" Gutter {{{

call s:HL('LineNr', 'mediumgravel', 'blackestgravel')
call s:HL('CursorLineNr', 'brightgravel', 'blackestgravel')
call s:HL('SignColumn', '', 'blackestgravel')
call s:HL('FoldColumn', 'mediumgravel', 'blackestgravel')

" }}}
" Cursor {{{

call s:HL('Cursor', 'vanta', 'tardis')
call s:HL('vCursor', 'vanta', 'tardis')
call s:HL('iCursor', 'vanta', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'plain')

" Comments are slightly brighter than folds, to make 'headers' easier to see. 
call s:HL('Comment', 'gravel')
call s:HL('Todo', 'snow', 'danger')
call s:HL('SpecialComment', 'snow', 'bg')

" Strings are a nice, pale straw color. Nothing too fancy.
call s:HL('String', 'dirtyblonde')

" Control flow stuff is taffy.
call s:HL('Statement', 'taffy', '')
call s:HL('Keyword', 'taffy', '')
call s:HL('Conditional', 'taffy', '')
call s:HL('Operator', 'taffy', '', 'none')
call s:HL('Label', 'taffy', '', 'none')
call s:HL('Repeat', 'taffy', '', 'none')

" Functions and variable declarations are orange, because plain looks weird.
call s:HL('Identifier', 'orange', '', 'none')
call s:HL('Function', 'orange', '', 'none')

" Preprocessor stuff is lime, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file. If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc', 'lime', '', 'none')
call s:HL('Macro', 'lime', '', 'none')
call s:HL('Define', 'lime', '', 'none')
call s:HL('PreCondit', 'lime', '')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant', 'toffee', '')
call s:HL('Character', 'toffee', '')
call s:HL('Boolean', 'toffee', '')

call s:HL('Number', 'toffee', '')
call s:HL('Float', 'toffee', '')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'dress', '')

call s:HL('Type', 'dress', '', 'none')
call s:HL('Structure', 'dress', '', 'none')

call s:HL('StorageClass', 'taffy', '', 'none')
call s:HL('Typedef', 'taffy', '')

" Make try/catch blocks stand out.
call s:HL('Exception', 'lime', '')

" Misc
call s:HL('Error', 'snow', 'taffy')
call s:HL('Debug', 'snow', '')
call s:HL('Ignore', 'gravel', '', '')

" LSP diagnostics
call s:HL('DiagnosticError', 'snow', 'maroon')
call s:HL('DiagnosticUnderlineError', 'snow', 'maroon')

call s:HL('DiagnosticWarning', 'vanta', 'olive')
call s:HL('DiagnosticUnderlineWarning', 'vanta', 'olive')

call s:HL('DiagnosticInfo', 'vanta', 'saltwatertaffy')
call s:HL('DiagnosticUnderlineInfo', 'vanta', 'saltwatertaffy')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'plain', 'deepergravel', 'none')
call s:HL('PmenuSel', 'vanta', 'tardis', 'none')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'taffy', 'vanta')
call s:HL('DiffAdd', 'snow', 'deepergravel')
call s:HL('DiffChange', '', 'blackgravel') " text on a line with changes
call s:HL('DiffText', 'olive', 'blackgravel') " actual changes

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
    call s:HL('SpellBad', '', 'bg', 'undercurl', 'dalespale')
    call s:HL('SpellLocal', '', '', 'undercurl', 'dalespale')
    call s:HL('SpellRare', '', '', 'undercurl', 'dalespale')
endif

" }}}

" }}}
" Plugins {{{
" Signify {{{
call s:HL('SignifySignAdd', 'lime', 'blackestgravel')
call s:HL('SignifySignChange', 'orange', 'blackestgravel')
call s:HL('SignifySignDelete', 'taffy', 'blackestgravel')
" }}}
" }}}

" vim:foldmethod=marker:foldlevel=0
