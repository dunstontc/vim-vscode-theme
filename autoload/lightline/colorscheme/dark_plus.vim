" =============================================================================
" Filename: dark_plus.vim
" Author: Clay Dunston
" License: MIT License
" Last Change: 2018-01-23
" =============================================================================

let s:black          = [ '#1e1e1e', 234 ]
let s:brightblack    = [ '#303030', 234 ]
let s:gray           = [ '#505050', 244 ]
let s:white          = [ '#d4d4d4', 253 ]
let s:darkblue       = [ '#569cd6', 75  ]
let s:cyan           = [ '#4ec9b0', 79  ]
let s:green          = [ '#608b4e', 65  ]
" let s:orange         = [ '#ce9178', 216 ]
let s:purple         = [ '#c586c0', 176 ]
let s:red            = [ '#d16969', 210 ]
let s:yellow         = [ '#d7ba7d', 179 ]
" let s:inactive_dark  = [ '#303030', 234, 'italic' ]
let s:inactive_light = [ '#d4d4d4', 234, 'italic' ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'command': {}}

let s:p.normal.left =     [ [ s:black,    s:green ],           [ s:white, s:gray ] ]
let s:p.normal.right =    [ [ s:black,    s:green ],           [ s:white, s:gray ] ]
let s:p.normal.middle =   [ [ s:green,    s:brightblack  ] ]
let s:p.insert.left =     [ [ s:black,    s:darkblue     ],    [ s:white, s:gray ] ]
let s:p.insert.right =    [ [ s:black,    s:darkblue     ],    [ s:white, s:gray ] ]
let s:p.insert.middle =   [ [ s:darkblue, s:brightblack  ] ]
let s:p.visual.left =     [ [ s:black,    s:purple       ],    [ s:white, s:gray ] ]
let s:p.visual.right =    [ [ s:black,    s:purple       ],    [ s:white, s:gray ] ]
let s:p.visual.middle =   [ [ s:purple,   s:brightblack  ] ]
let s:p.replace.left =    [ [ s:black,    s:red          ],    [ s:purple, s:gray ] ]
" let s:p.command.left =    [ [ s:black,    s:red          ],    [ s:purple, s:gray ] ]
" let s:p.inactive.left =   [ [ s:white,    s:brightblack  ], [ s:white, s:gray ] ]
let s:p.inactive.left =   [ [ s:green,    s:brightblack, 'italic' ], [ s:white, s:gray, 'italic'] ]
let s:p.inactive.right =  [ [ s:green,    s:brightblack ],[ s:white, s:gray  ] ]
let s:p.inactive.middle = [ [ s:green,    s:brightblack ] ]
let s:p.tabline.left =    [ [ s:green,    s:brightblack ] ]
let s:p.tabline.tabsel =  [ [ s:black,    s:green       ] ]
let s:p.tabline.middle =  [ [ s:inactive_light, s:brightblack, 'italic' ] ]
" let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error =    [ [ s:red,      s:brightblack ] ]
let s:p.normal.warning =  [ [ s:yellow,   s:brightblack ] ]
let s:p.normal.special =  [ [ s:cyan,     s:brightblack ] ]

let g:lightline#colorscheme#dark_plus#palette = lightline#colorscheme#flatten(s:p)

