" ==============================================================================
" FILE: Dark Plus Vim
" Author: Clay Dunston <dunstontc@gmail.com>
" License: MIT License
" Last Modified: 2018-01-23
" ==============================================================================

" Setup: {{{
scriptencoding utf-8

if exists('syntax on')
  syntax reset
endif

hi clear
let g:colors_name='dark_plus'
set background=dark

if ! exists('g:dark_plus_termcolors')
  let g:dark_plus_termcolors = 256
endif

if ! exists('g:dark_plus_terminal_italics')
  let g:dark_plus_terminal_italics = 1
endif

" shamelessly stolen from challenger-deep/vim, where it was
" shamelessly stolen from hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:dark_plus_terminal_italics ==? 0 && has_key(a:style, 'cterm') && a:style['cterm'] ==? 'italic'
    unlet a:style.cterm
  endif
  if g:dark_plus_termcolors == 16
    let l:ctermfg = (has_key(a:style, 'fg') ? a:style.fg.cterm16 : 'NONE')
    let l:ctermbg = (has_key(a:style, 'bg') ? a:style.bg.cterm16 : 'NONE')
  else
    let l:ctermfg = (has_key(a:style, 'fg') ? a:style.fg.cterm : 'NONE')
    let l:ctermbg = (has_key(a:style, 'bg') ? a:style.bg.cterm : 'NONE')
  end
  execute 'highlight' a:group
        \ 'guifg='   (has_key(a:style, 'fg')    ? a:style.fg.gui   : 'NONE')
        \ 'guibg='   (has_key(a:style, 'bg')    ? a:style.bg.gui   : 'NONE')
        \ 'guisp='   (has_key(a:style, 'sp')    ? a:style.sp.gui   : 'NONE')
        \ 'gui='     (has_key(a:style, 'gui')   ? a:style.gui      : 'NONE')
        \ 'ctermfg=' . l:ctermfg
        \ 'ctermbg=' . l:ctermbg
        \ 'cterm='   (has_key(a:style, 'cterm') ? a:style.cterm    : 'NONE')
endfunction
" }}}
" ==============================================================================
" Colors: {{{
" ==============================================================================
let s:nop =          { 'gui': 'NONE',    'cterm16':'NONE','cterm': 'NONE'}

let s:White =        { 'gui': '#d4d4d4', 'cterm16': '07', 'cterm': '188' }
let s:LightGray =    { 'gui': '#808080', 'cterm16': '07', 'cterm': '244' }
let s:Gray =         { 'gui': '#505050', 'cterm16': '00', 'cterm': '08'  }
let s:DarkGray =     { 'gui': '#303030', 'cterm16': '00', 'cterm': '234' }
let s:Black =        { 'gui': '#1e1e1e', 'cterm16': '00', 'cterm': '234' }

let s:Red =          { 'gui': '#f44747', 'cterm16': '01', 'cterm': '203' }
let s:LightRed =     { 'gui': '#d16969', 'cterm16': '01', 'cterm': '167' }
let s:Orange =       { 'gui': '#ce9178', 'cterm16': '03', 'cterm': '173' }
let s:YellowOrange = { 'gui': '#d7ba7d', 'cterm16': '03', 'cterm': '179' }
let s:Yellow =       { 'gui': '#dcdcaa', 'cterm16': '03', 'cterm': '187' }
let s:Green =        { 'gui': '#608b4e', 'cterm16': '02', 'cterm': '65'  }
let s:LightGreen =   { 'gui': '#b5cea8', 'cterm16': '09', 'cterm': '151' }
let s:Blue =         { 'gui': '#569cd6', 'cterm16': '04', 'cterm': '75'  }
let s:LightBlue =    { 'gui': '#9cdcfe', 'cterm16': '06', 'cterm': '117' }
let s:DarkBlue =     { 'gui': '#264f78', 'cterm16': '04', 'cterm': '24'  }
let s:BrightBlue =   { 'gui': '#007acc', 'cterm16': '04', 'cterm': '33'  }
let s:Cyan =         { 'gui': '#4ec9b0', 'cterm16': '06', 'cterm': '43'  }
let s:Magenta =      { 'gui': '#c586c0', 'cterm16': '13', 'cterm': '176' }
let s:Violet =       { 'gui': '#646695', 'cterm16': '07', 'cterm': '60'  }
" #3b629d
" let s:cdSearch =        { 'gui': '#4c4e50', 'cterm16': '03', 'cterm': '239' }
" let s:cdSearchCurrent = { 'gui': '#49545f', 'cterm16': '09', 'cterm': '239' }
"
" ===============================================================================
" Terminal Colors:  {{{
" ==============================================================================
let g:terminal_color_0 =  s:Black.gui        " black
let g:terminal_color_1 =  s:Red.gui          " red
let g:terminal_color_2 =  s:Green.gui        " green
let g:terminal_color_3 =  s:YellowOrange.gui " yellow
let g:terminal_color_4 =  s:Blue.gui         " blue
let g:terminal_color_5 =  s:Magenta.gui      " magenta
let g:terminal_color_6 =  s:Cyan.gui         " cyan
let g:terminal_color_7 =  s:White.gui        " white
let g:terminal_color_8 =  s:Black.gui        " bright_black
let g:terminal_color_9 =  s:Red.gui          " bright_red
let g:terminal_color_10 = s:Green.gui        " bright_green
let g:terminal_color_11 = s:YellowOrange.gui " bright_yellow
let g:terminal_color_12 = s:Blue.gui         " bright_blue
let g:terminal_color_13 = s:Magenta.gui      " bright_magenta
let g:terminal_color_14 = s:Cyan.gui         " bright_cyan
let g:terminal_color_15 = s:White.gui        " bright_white
let g:terminal_color_background = g:terminal_color_0
let g:terminal_color_foreground = g:terminal_color_7
if &background ==? 'light'
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
endif
" }}}

call s:h('DarkGray',     {'fg': s:Gray})
call s:h('DarkGray',     {'fg': s:DarkGray})
call s:h('Gray',         {'fg': s:LightGray})
call s:h('Red',          {'fg': s:Red})
call s:h('LightRed',     {'fg': s:LightRed})
call s:h('Orange',       {'fg': s:Orange})
call s:h('YellowOrange', {'fg': s:YellowOrange,})
call s:h('Yellow',       {'fg': s:Yellow})
call s:h('Green',        {'fg': s:Green})
call s:h('Blue',         {'fg': s:Blue})
call s:h('LightGreen',   {'fg': s:LightGreen})
call s:h('Cyan',         {'fg': s:Cyan})
call s:h('DarkBlue',     {'fg': s:DarkBlue})
call s:h('LightBlue',    {'fg': s:LightBlue})
call s:h('BrightBlue',   {'fg': s:BrightBlue})
call s:h('Magenta',      {'fg': s:Magenta})
call s:h('Violet',       {'fg': s:Violet})

call s:h('nop',          {'fg':  s:nop,       'bg':    s:nop})
call s:h('Bold',         {'gui': 'bold',      'cterm': 'bold'})
call s:h('Italic',       {'gui': 'italic',    'cterm': 'italic'})
call s:h('Underlined',   {'gui': 'underline', 'cterm': 'underline'})
" }}}
" ==============================================================================
" Scopes: {{{
" Mainly related to flow control like `continue`, `while`, `return`, etc.
call s:h('Control',      {'fg': s:Magenta})
" escape sequences like `\n` or `\\\\\\`; Also literal control characters like `^m`
call s:h('Escape',       {'fg': s:YellowOrange})
" The Name of a function or method.
call s:h('Function',     {'fg': s:Yellow})
" Any numeric value.
call s:h('Number',       {'fg': s:LightGreen})
" Operators can either be textual (e.g. `or`) or be characters (e.g. `||`).
call s:h('Operator',     {'fg': s:Violet})
" Regular Expressions.
call s:h('RegEx',        {'fg': s:LightRed})
" Strings.
call s:h('String',       {'fg': s:Orange})
" Assignment keywords like `let`, `var`, `new`, etc.
call s:h('Storage',      {'fg': s:Blue})
" Reserved language variables like `this`, `super`, `self`, etc.
call s:h('Language',     {'fg': s:Blue, 'gui': 'italic', 'cterm': 'italic'})
" Type or Class names.
call s:h('Type',         {'fg': s:Cyan})
" Variables. Not all languages allow easy identification (and thus markup) of these.
call s:h('Var',          {'fg': s:LightBlue})
" }}}
" ==============================================================================
" Vim Default Colors: {{{
" ==============================================================================
call s:h('Normal',          {'fg': s:White,     'bg': s:Black})
call s:h('NormalNC',        {                   'bg': s:DarkGray})
call s:h('ColorColumn',     {                   'bg': s:DarkGray})
call s:h('iCursor',         {                   'bg': s:Blue})
call s:h('vCursor',         {                   'bg': s:Magenta})
call s:h('rCursor',         {                   'bg': s:LightRed})
call s:h('Cursor',          {                   'bg': s:Green})
call s:h('TermCursor',      {                   'bg': s:Green})
call s:h('CursorLine',      {                   'bg': s:DarkGray})
call s:h('Directory',       {'fg': s:Blue})
call s:h('DiffAdd',         {                   'bg': s:Green})
hi link diffAdded DiffAdd
call s:h('DiffChange',      {                   'bg': s:Yellow})
call s:h('DiffDelete',      {                   'bg': s:LightRed})
call s:h('DiffText',        {                   'bg': s:White})
call s:h('EndOfBuffer',     {'fg': s:Black,     'bg': s:DarkGray})
call s:h('ErrorMsg',        {'fg': s:LightRed,  'bg': s:nop})
call s:h('VertSplit',       {'fg': s:Black,     'bg': s:DarkGray})
call s:h('Folded',          {'fg': s:Gray,      'bg': s:nop})
call s:h('FoldColumn',      {'fg': s:Black,     'bg': s:DarkGray})
call s:h('SignColumn',      {                   'bg': s:DarkGray})
call s:h('IncSearch',       {'fg': s:nop,       'bg': s:DarkBlue})
call s:h('LineNr',          {'fg': s:Gray,      'bg': s:DarkGray})
call s:h('CursorLineNr',    {'fg': s:Green,     'bg': s:DarkGray})
call s:h('MatchParen',      {                   'bg': s:DarkBlue})
" (valloric/matchtagalways)
hi link matchTag MatchParen
call s:h('ModeMsg',        {'fg': s:LightGray,})
call s:h('MoreMsg',        {'fg': s:White,})
call s:h('NonText',        {'fg': s:LightGray,  'bg': s:nop})
call s:h('Pmenu',          {'fg': s:White,      'bg': s:DarkGray})
call s:h('PmenuSel',       {'fg': s:White,      'bg': s:DarkBlue,})
call s:h('PmenuSbar',      {                    'bg': s:LightGray})
call s:h('PmenuThumb',     {                    'bg': s:BrightBlue})
call s:h('Question',       {'fg': s:Cyan,       'bg': s:nop})
call s:h('Search',         {'fg': s:nop,        'bg': s:DarkBlue})
call s:h('Substitute',     {'fg': s:nop,        'bg': s:DarkBlue})
call s:h('SpellBad',       {'fg': s:LightRed,   'bg': s:nop})
call s:h('SpellCap',       {'fg': s:LightRed,   'bg': s:nop})
call s:h('SpellLocal',     {'fg': s:LightRed,   'bg': s:nop})
call s:h('StatusLine',     {'fg': s:White,      'bg': s:nop})
call s:h('StatusLineNC',   {'fg': s:nop,        'bg': s:nop})
call s:h('TabLine',        {'fg': s:White,      'bg': s:DarkGray,   'gui': 'italic'})
call s:h('TabLineFill',    {'fg': s:White,      'bg': s:Black,      'gui': 'italic'})
call s:h('TabLineSel',     {'fg': s:White,      'bg': s:Black})
call s:h('Title',          {'fg': s:Blue,                           'gui': 'bold'})
call s:h('Visual',         {'fg': s:nop,        'bg': s:DarkBlue,})
call s:h('VisualNOS',      {'fg': s:nop,        'bg': s:DarkBlue,})
call s:h('WarningMsg',     {'fg': s:Orange})
call s:h('WildMenu',       {'fg': s:White,      'bg': s:DarkBlue,})

call s:h('Comment',        {'fg': s:Gray,                           'gui': 'italic'})
call s:h('SpecialComment', {'fg': s:Green,                          'gui': 'italic'})
call s:h('SpecialKey',     {'fg': s:Green,                          'gui': 'none'})

call s:h('Tag',            {'fg': s:Green})
call s:h('Debug',          {'fg': s:BrightBlue, 'bg': s:LightRed,})
call s:h('Ignore',         {})
call s:h('Conceal',        {'fg': s:White,      'bg': s:Black})
call s:h('Error',          {'fg': s:LightRed})
call s:h('Todo',           {'fg': s:White,      'bg': s:Green,      'gui': 'bold,italic'})
call s:h('Underlined',     {                                        'gui': 'underline', 'cterm': 'underline'})

call s:h('Constant',       {'fg': s:Blue})
call s:h('PreProc',        {'fg': s:Blue})
hi link Boolean Constant

call s:h('String',         {'fg': s:Orange})
hi link Character Escape

call s:h('Number',         {'fg': s:LightGreen})
hi link Float Number

call s:h('Identifier',     {'fg': s:LightBlue})

call s:h('Function',       {'fg': s:Yellow})

hi link Conditional Control
hi link Exception Control
hi link Keyword Control
hi link Define Control
hi link Include Control
hi link Label Control
hi link Repeat Control
hi link Statement Control
call s:h('Macro',          {'fg': s:Magenta})
call s:h('PreCondit',      {'fg': s:Magenta})

call s:h('Type',           {'fg': s:Cyan})
hi link Typedef Type

hi link Structure Storage
hi link StorageClass Storage

call s:h('Operator',       {'fg': s:White})
call s:h('Delimiter',      {'fg': s:White})
call s:h('Special',        {'fg': s:White, 'gui': 'italic'})
call s:h('SpecialChar',    {'fg': s:White})

" Help: {{{
call s:h('helpHeadline',       {'fg': s:Magenta})
call s:h('helpHeader',         {'fg': s:Magenta})
call s:h('helpHyperTextEntry', {'fg': s:Blue})
call s:h('helpHyperTextJump',  {'fg': s:LightBlue})
call s:h('helpSectionDelim',   {'fg': s:BrightBlue})
call s:h('helpExample',        {'fg': s:Orange})
call s:h('helpSpecial',        {'fg': s:Cyan})
call s:h('helpURL',            {'fg': s:LightBlue})
" call s:h('helpBar',            {})
" call s:h('helpNote',           {})
" call s:h('helpOption',         {})
call s:h('helpCommand',        {'fg': s:Yellow})
" }}}

" Quickfix: {{{
call s:h('qfFileName',         {'fg': s:Blue})
call s:h('qfLineNr',           {'fg': s:LightGreen})
" }}}
" }}}

" ==============================================================================
"  Languages & Filetypes
" ==============================================================================

" C: {{{
hi link cSpecialCharacter Escape
" }}}

" C# {{{
hi link csThis Language
hi link csNew Constant
hi link csInterpolation Identifier
hi link csInterpolationDelim Constant
hi link csDocComment SpecialComment
hi link csDocExample Identifier
hi link csDocString Identifier
hi link csOperator Conditional
hi link csModifier Conditional
hi link csLinqKeyword Conditional
hi link csUnspecifiedStatement Normal
" }}}

" CSS: {{{
hi link cssBraces Gray
hi link cssNoise  DarkGray
hi link cssClassNameDot DarkGray
call s:h('cssInclude',         {'fg': s:Magenta})
call s:h('cssTagName',         {'fg': s:YellowOrange})
call s:h('cssClassName',       {'fg': s:YellowOrange})
call s:h('cssPseudoClass',     {'fg': s:YellowOrange})
call s:h('cssPseudoClassId',   {'fg': s:YellowOrange})
call s:h('cssPseudoClassLang', {'fg': s:YellowOrange})
call s:h('cssIdentifier',      {'fg': s:YellowOrange})
hi link cssProp Identifier
hi link cssDefinition Identifier
hi link cssAttr String
hi link cssAttrRegion String
hi link cssColor String
hi link cssFunction String
hi link cssVendor String
hi link cssFunctionName Function
hi link cssValueNumber Number
hi link cssValueLength Number
hi link cssUnitDecorators Number
" }}}

" Dosini: {{{
hi link dosiniHeader Define
hi link dosiniNumber Number
hi link dosiniComment Comment
hi link dosiniLabel Identifier
" }}}

" Git: {{{
hi link gitcommitHeader Normal
call s:h('gitcommitBranch',    {'fg': s:Magenta})
call s:h('gitcommitUntracked', {'fg': s:YellowOrange,})
hi link gitcommitWarning WarningMsg
" call s:h('gitcommitDiscarded', {'fg': s:Magenta})
call s:h('gitconfigNone',      {'fg': s:White})
call s:h('gitconfigEscape',    {'fg': s:YellowOrange})
" }}}

" Golang: {{{
hi link goTodo Todo
hi link goComment Comment
hi link goDocComment SpecialComment
hi link goPackageComment Comment
hi link goCommentEmphasis Character
hi link goMain Normal
hi link goStatement Conditional
hi link goOperator Conditional
hi link goImport Conditional
call s:h('goPackageName',           {'fg': s:White,  'gui': 'italic'})
call s:h('goReceiver',              {'fg': s:White})
hi link goPackage StorageClass
hi link goVar StorageClass
" hi link goFormatSpecifier Identifier
hi link goFloats Type
hi link goArgumentType Type
hi link goTypeName Type
hi link goReceiverType Type
call s:h('goType',                  {'fg': s:Cyan,   'gui': 'italic'})
call s:h('goFloats',                {'fg': s:Cyan,   'gui': 'italic'})
" ' hi link goSimpleArguments nop
call s:h('goSignedInts',            {'fg': s:Cyan,   'gui': 'italic'})
call s:h('goUnsignedInts',          {'fg': s:Cyan,   'gui': 'italic'})
call s:h('goComplexes',             {'fg': s:Blue})
hi link goBoolean Boolean
hi link goPredefinedIdentifiers Constant
hi link goConst Constant
hi link goDeclaration Constant
hi link goDeclType Constant
hi link goTypeDecl Constant
hi link goVarAssign Identifier
hi link goVarDefs Identifier
hi link goSingleDecl Identifier
hi link goReceiverVar Identifier
hi link goFunctionCall Function
hi link goMethodCall Function
hi link goBuiltins Function
hi link goEscapeC Escape
" }}}

" HTML: {{{
call s:h('htmlHead',           {'fg': s:LightGray})
call s:h('htmlTitle',          {'fg': s:White})
call s:h('htmlTag',            {'fg': s:LightGray})
call s:h('htmlEndTag',         {'fg': s:LightGray})
call s:h('htmlTagName',        {'fg': s:Blue})
call s:h('htmlSpecialTagName', {'fg': s:Blue})
hi link htmlArg Identifier
call s:h('htmlBold',           {'fg': s:Magenta})
call s:h('htmlItalic',         {'fg': s:Cyan, 'gui': 'italic'})
hi link htmlComment Comment
hi link xmlAttrib   htmlArg
hi link xmlTagName  htmlTagName
hi link xmlEndTag   htmlTagName
hi link xmlTag      htmlTag
hi link xmlEqual    htmlTag
" }}}

" JavaScript: {{{
hi link jsNoise Normal
hi link jsGlobalObjects Type
hi link jsGlobalNodeObjects Type
hi link jsObjectProp Type
hi link jsClassDefinition Type
hi link jsFuncCall Function
hi link jsFunction Function
hi link jsVariableDef Identifier
hi link jsParen Identifier
hi link jsFuncArgs Identifier
hi link jsParenRepeat Identifier
hi link jsParenSwitch Identifier
hi link jsParenIfElse Identifier
hi link jsObjectKey Identifier
hi link jsObjectStringKey Identifier
hi link jsTemplateExpression Identifier
hi link jsThis Language
hi link jsClassKeyword Boolean
hi link jsTemplateString String
hi link jsSpecial Character
hi link jsRegexpString RegEx
hi link jsTemplateBraces StorageClass
hi link jsSwitchColon Operator
hi link jsOperator Conditional
hi link jsExtendsKeyword Conditional
" }}}

" JSON:
" (elzr/vim-json) {{{
hi link jsonString  String
hi link jsonKeyword Identifier
call s:h('jsonKeywordMatch', {'fg': s:Gray})
call s:h('jsonBraces',       {'fg': s:Gray})
call s:h('jsonNoise',        {'fg': s:Gray})
call s:h('jsonQuote',        {'fg': s:Gray})
" (Quramy/vison)
call s:h('jsonCommentError', {'fg': s:LightGray})
hi link jsonEscape Character
call s:h('jsonFold',         {'fg': s:Gray})
" }}}

" Lua:
" (tbastos/vim-lua) {{{
hi link luaFuncName    Function
hi link luaString      String
hi link luaFuncArg     Identifier
hi link luaFuncArgName Identifier
call s:h('luaFunc',           {})
call s:h('luaComma',          {})
call s:h('luaFuncParens',     {})
call s:h('luaSymbolOperator', {})
call s:h('luaBraces',         {'fg': s:White})
hi link luaFuncKeyword Control
call s:h('luaTable',          {})
call s:h('luaFuncSig',        {})
" }}}

" Markdown:
" (tpope/vim-markdown) {{{
call s:h('markdownH1',               {'fg': s:Blue})
call s:h('markdownH2',               {'fg': s:Blue})
call s:h('markdownH3',               {'fg': s:Blue})
call s:h('markdownH4',               {'fg': s:Blue})
call s:h('markdownH5',               {'fg': s:Blue})
call s:h('markdownH6',               {'fg': s:Blue})
call s:h('markdownHeadingDelimiter', {'fg': s:Blue})
call s:h('markdownItalic',           {'fg': s:LightBlue, 'gui': 'italic'})
call s:h('markdownItalicDelimiter',  {'fg': s:Gray})
call s:h('markdownBold',             {'fg': s:Magenta,   'gui': 'bold'})
call s:h('markdownBoldDelimiter',    {'fg': s:Gray})
call s:h('markdownListMarker',       {'fg': s:BrightBlue})
call s:h('markdownCode',             {'fg': s:Orange})
call s:h('markdownCodeDelimiter',    {'fg': s:Gray})
call s:h('markdownUrl',              {'fg': s:Gray})
call s:h('markdownLinkText',         {'fg': s:LightBlue})
call s:h('markdownLinkTextDelimiter',{'fg': s:Gray})
call s:h('markdownLinkDelimiter',    {'fg': s:Gray})
call s:h('markdownBlockquote',       {'fg': s:Green})
" }}}

" (plasticboy/vim-markdown) {{{
call s:h('mkdItalic',           {'gui': 'italic'})
call s:h('mkdBold',             {'gui': 'bold'})
call s:h('mkdBoldItalic',       {'gui': 'bold,italic'})
call s:h('mkdFootnotes',        {})
call s:h('mkdFootnote',         {})
call s:h('mkdID',               {})
call s:h('mkdURL',              {'fg': s:Orange})
call s:h('mkdLink',             {'fg': s:LightBlue,})
call s:h('mkdInlineURL',        {'fg': s:Orange})
call s:h('mkdLinkDefTarget',    {'fg': s:LightBlue,})
call s:h('mkdLinkDef',          {'fg': s:LightBlue,})
call s:h('mkdLinkTitle',        {'fg': s:LightBlue,})
call s:h('mkdLineBreak',        {})
call s:h('mkdBlockquote',       {'fg': s:Green})
call s:h('mkdCode',             {'fg': s:Orange})
call s:h('mkdListItem',         {'fg': s:BrightBlue,})
call s:h('mkdListItemLine',     {})
call s:h('mkdNonListItemBlock', {})
call s:h('mkdRule',             {'fg': s:Magenta})
call s:h('mkdDelimiter',        {'fg': s:Gray})
" }}}

" Perl:{{{
hi link perlSpecialString Escape
hi link perlVarMember Type
"}}}

" Python: {{{
call s:h('pythonRun',             {'fg': s:Blue})
call s:h('pythonCoding',          {'fg': s:Blue})
call s:h('pythonBuiltinFunc',     {'fg': s:Blue})
call s:h('pythonClassVar',        {'fg': s:Blue, 'gui': 'italic'})
hi link pythonAttribute Identifier
hi link pythonDot Identifier
hi link pythonFunction Function
hi link pythonClassName Type
hi link pythonBuiltinObj Type
hi link pythonInclude Control
hi link pythonOperator Control
hi link pythonStatement Control
hi link pythonNumber Number
hi link pythonString String
hi link pythonRawString String
hi link pythonFString String
" call s:h('pythonRawString',       {'fg': s:Orange})
" call s:h('pythonFString',         {'fg': s:Orange})
hi link pythonStrFormat Identifier
hi link pythonStrInterpRegion Identifier
hi link pythonStrTemplate Identifier
hi link pythonStrFormatting Character
hi link pythonEscape Character
hi link pythonRawEscape Character
hi link pythonUniEscape Character
hi link pythonBytesEscape Character
hi link pythonTrippleQuotes SpecialComment
hi link pythonDocString SpecialComment
hi link pythonCommentTitle SpecialComment
hi link pythonComment Comment
" (tweekmonster/impsort.vim)
call s:h('pythonImport',          {'fg': s:Magenta})
call s:h('pythonIncludeLine',     {'fg': s:Cyan})
call s:h('pythonImportedModule',  {'fg': s:LightBlue})
call s:h('pythonImportedObject',  {'fg': s:Cyan})
call s:h('pythonImportedFuncDef', {'fg': s:Yellow})
call s:h('impsortNonImport',      {'fg': s:LightBlue})
" }}}

" Ruby: {{{
call s:h('rubyClassNameTag', {'fg': s:Cyan})
" }}}

" Sh: {{{
hi link shFunction Function
call s:h('shFunctionKey',       {'fg': s:Magenta})
call s:h('shFunctionOne',       {'fg': s:White})
call s:h('shFunctionTwo',       {'fg': s:White})
call s:h('shFunctionStatement', {'fg': s:Magenta})
call s:h('shEscape',            {'fg': s:YellowOrange})
call s:h('shSpecial',           {'fg': s:YellowOrange})
call s:h('shConditional',       {'fg': s:Magenta})
call s:h('shCommandSub',        {})
call s:h('shCmdParenRegion',    {})
call s:h('shCmdSubRegion',      {})
call s:h('shQuote',             {'fg': s:Orange})
call s:h('shDoubleQuote',       {'fg': s:Orange})
call s:h('shOption',            {'fg': s:Magenta})
call s:h('shStatement',         {'fg': s:Blue})
call s:h('shDeref',             {'fg': s:White})
call s:h('shDerefVar',          {'fg': s:LightBlue})
call s:h('shDerefSpecial',      {'fg': s:LightBlue})
call s:h('shDerefPattern',      {'fg': s:LightRed})
call s:h('shDerefOp',           {'fg': s:LightRed})
call s:h('shDerefSimple',       {'fg': s:LightBlue})
call s:h('shDerefVarArray',     {'fg': s:LightBlue})
call s:h('shRepeat',            {'fg': s:LightBlue})
call s:h('shFor',               {'fg': s:LightBlue})
call s:h('shCtrlSeq',           {'fg': s:Cyan})
call s:h('shOperator',          {'fg': s:White})
call s:h('shTestOpr',           {'fg': s:White})
call s:h('shExpr',              {'fg': s:White})
call s:h('shIf',                {'fg': s:Magenta})
call s:h('shDo',                {'fg': s:Magenta})
call s:h('shLoop',              {'fg': s:Magenta})
call s:h('shDblBrace',          {'fg': s:Magenta})
call s:h('shSubSh',             {})
call s:h('shSubRegion',         {})
" }}}

" BASH: {{{
hi link bashBuiltinCommands Function
" }}}

" ZSH: {{{
hi link zshFunction Function
hi link zshVariableDef Identifier
call s:h('zshParentheses', {'fg': s:White})
" }}}

" Todo:
" (todo.txt) {{{
call s:h('todoItem',        {'fg': s:White})
call s:h('todoID',          {'fg': s:Gray})
call s:h('todoDone',        {'fg': s:LightGray})
call s:h('todoDate',        {'fg': s:LightGray})
call s:h('todoOverDueDate', {'fg': s:LightRed})
call s:h('todoProject',     {'fg': s:Cyan})
call s:h('todoContext',     {'fg': s:LightBlue})
call s:h('todoExtra',       {'fg': s:LightGreen})
call s:h('todoString',      {'fg': s:Cyan})
call s:h('todoPriorityA',   {'fg': s:Red})
call s:h('todoPriorityB',   {'fg': s:LightRed})
call s:h('todoPriorityC',   {'fg': s:Orange})
call s:h('todoPriorityD',   {'fg': s:YellowOrange})
call s:h('todoPriorityE',   {'fg': s:Yellow})
call s:h('todoPriorityF',   {'fg': s:LightGreen})
call s:h('todoComment',     {'fg': s:Gray, 'gui': 'italic'})
" }}}

" TSV:
" (chrisbra/csv.vim) {{{
hi link CSVComment Comment
call s:h('CSVColumnEven',       {'fg': s:Blue})
call s:h('CSVColumnOdd',        {'fg': s:Green})
call s:h('CSVColumnHeaderEven', {'fg': s:Black, 'bg': s:Blue})
call s:h('CSVColumnHeaderOdd',  {'fg': s:Black, 'bg': s:Green})
" }}}

" VimL: {{{
hi link vimCtrlChar YellowOrange
call s:h('vimEcho',           {'fg': s:Yellow})
hi link vimNamespace Type
hi link vimCVar Type
hi link vimVarNamespace Type
hi link vimVar Identifier
call s:h('vimEnvVar',         {'fg': s:LightBlue, 'gui': 'italic'})
call s:h('vimBuiltin',        {'fg': s:Blue}) " FIXME: find a better additional context color for ≈ global scope
hi link vimFunc Function
hi link vimUserFunc Function
hi link vimUserCmd Function
hi link vimDocBlock SpecialComment
" call s:h('vimUserCmd',        {'fg': s:Yellow})
" call s:h('vimUserAttrb',      {'fg': s:Yellow})
" call s:h('vimUserAttrbKey',   {'fg': s:Yellow})
hi link vimFunction Function
call s:h('vimFunctionError',  {'fg': s:Red})
call s:h('vimContinue',       {'fg': s:Gray})
call s:h('vimLineComment',    {'fg': s:Gray, 'gui': 'italic'})
hi link vimCommentTitle SpecialComment
call s:h('vimBracket',        {'fg': s:LightGray})
call s:h('vimNotFunc',        {'fg': s:Magenta})
call s:h('vimCommand',        {'fg': s:Magenta})
call s:h('vimCmdSep',         {'fg': s:Magenta})
call s:h('vimOperParen',      {'fg': s:LightBlue})
call s:h('vimParenSep',       {'fg': s:White})
call s:h('vimSetSep',         {'fg': s:White})
call s:h('vimOper',           {'fg': s:Violet})
call s:h('vimSep',            {'fg': s:White})
call s:h('vimOption',         {'fg': s:LightBlue})
call s:h('vimSet',            {'fg': s:LightBlue})
call s:h('vimLet',            {'fg': s:Blue})
call s:h('vimMap',            {'fg': s:Magenta})
call s:h('vimNotation',       {'fg': s:YellowOrange})
call s:h('vimMapMod',         {'fg': s:LightGray})
call s:h('vimMapModKey',      {'fg': s:Blue})
call s:h('vimMapLhs',         {'fg': s:LightBlue})
call s:h('vimMapRhs',         {'fg': s:Cyan})
call s:h('vimFtOption',       {'fg': s:Cyan})
call s:h('vimIsCommand',      {'fg': s:LightBlue})
call s:h('vimFtCmd',          {'fg': s:Magenta})
call s:h('vimHighlight',      {'fg': s:Blue})
call s:h('vimHiAttrib',       {'fg': s:LightBlue})
call s:h('vimHiLink',         {'fg': s:YellowOrange})
call s:h('vimHLGroup',        {'fg': s:YellowOrange})
call s:h('vimEchoHL',         {'fg': s:Cyan})
call s:h('vimAutoCmd',        {})
call s:h('vimAutoEvent',      {})
call s:h('vimAutoCmdSfxList', {})
" ' Vim Syntax RegEx:
call s:h('vimSynRegPat',      {'fg': s:LightRed})
call s:h('vimPatSep',         {'fg': s:Magenta})
call s:h('vimPatSepR',        {'fg': s:YellowOrange,})
call s:h('vimSynPatRange',    {'fg': s:LightBlue})
call s:h('vimSynPatMod',      {'fg': s:LightBlue})
call s:h('vimSynNotPatRange', {'fg': s:Blue})
call s:h('vimSynMatchRegion', {'fg': s:LightRed})
" call s:h('vimSynPatRegion',   {})
" call s:h('vimPatRegion',      {'fg': s:Yellow})
" call s:h('vimCollection',     {'fg': s:Blue})
" ' Vim Syntax Groups:
call s:h('vimGroupList',      {'fg': s:LightBlue})
call s:h('vimGroup',          {'fg': s:YellowOrange,})
call s:h('vimHiGroup',        {'fg': s:Cyan})
call s:h('vimGroupName',      {'fg': s:LightBlue})
call s:h('vimGroupAdd',       {'fg': s:Magenta})
" call s:h('vimClusterName',                      {}, {}, 'none',   {})
call s:h('vimSynNextGroup',   {'fg': s:Magenta})
" ' Vim Syntax:
call s:h('vimSyn',            {})
hi link vimSynType       Type
hi link vimSynCase       Constant
hi link vimSyncLinecont  Constant
hi link vimSyncMatch     Constant
hi link vimSynRegOpt     Constant
hi link vimSyntax        Conditional
hi link vimSynKeyOpt     Conditional
hi link vimSynContains   Conditional
hi link vimSynReg        Conditional
hi link vimSynMtchOpt    Conditional
hi link vimSynMtchGrp    Conditional
" ' call s:h('vimSynCase',        {},               {}, 'none',   {})
" call s:h('vimSynRegion',     {},        {}, 'none',   {})
" call s:h('vimSynKeyRegion',  {},         {}, 'none',   {})
call s:h('nvimMap',           {'fg': s:Violet})
call s:h('nvimMapBang',       {'fg': s:Violet})
call s:h('nvimUnmap',         {'fg': s:Violet})
call s:h('nvimHLGroup',       {'fg': s:Violet})
" call s:h('termcursor',      {'fg': s:Violet, 'bg': s:Green,})
" call s:h('termcursornc',    {'fg': s:Violet, 'bg': s:BrightBlue,})
" call s:h('quickfixline',    {'fg': s:Violet, 'bg': s:Violet})
" }}}

" YAML: {{{
hi link yamlPlainScalar String
hi link yamlBlockMappingKey Identifier
hi link yamlFlowString String
hi link yamlFlowStringDelimiter String
hi link yamlEscape Character
call s:h('yamlDocumentStart',       {'fg': s:Magenta})
call s:h('yamlDocumentEnd',         {'fg': s:Magenta})
call s:h('yamlKeyValueDelimiter',   {'fg': s:Magenta})
" }}}

" ==============================================================================
"  === Plugin Filetypes ===
" ==============================================================================

" (SirVer/ultisnips) {{{
call s:h('snipSnippet',              {})
call s:h('snipSnippetBody',          {'fg': s:White})
call s:h('snipSnippetDocString',     {'fg': s:Orange})
call s:h('snipSnippetTrigger',       {'fg': s:Yellow})
call s:h('snipEscape',               {'fg': s:YellowOrange})
call s:h('snipSnippetHeader',        {'fg': s:Gray})
call s:h('snipSnippetFooter',        {'fg': s:Gray})
call s:h('snipSnippetFooterKeyword', {'fg': s:LightGray})
call s:h('snipSnippetHeaderKeyword', {'fg': s:LightGray})
call s:h('snipTabStop',              {'fg': s:Blue})
call s:h('snipTabStopDefault',       {'fg': s:LightBlue})
call s:h('snipVisual',               {'fg': s:DarkBlue})
call s:h('snipCommand',              {'fg': s:Cyan})
call s:h('snipVimlCommand',          {'fg': s:Cyan})
call s:h('snipVimlCommandV',         {'fg': s:Cyan})
call s:h('snipPythonCommand',        {'fg': s:Cyan})
call s:h('snipPythonCommandP',       {'fg': s:Cyan})
call s:h('snipSnippetOptions',       {})
call s:h('snipGlobal',               {'fg': s:Magenta})
call s:h('snipGlobalPHeader',        {'fg': s:Cyan})
call s:h('snipGlobalHeaderKeyword',  {'fg': s:Magenta})
call s:h('snipSnippetOptionFlag',    {'fg': s:Magenta})
call s:h('snipLeadingSpaces',        {'fg': s:nop})
call s:h('snipLeadingSpaces',        {'fg': s:nop})
" }}}

" (Shougo/neosnippet) {{{
" call s:h('neosnippetName',             {'fg': s:Cyan})
" call s:h('neosnippetAbbr',             {'fg': s:Orange})
" call s:h('neosnippetOption',           {'fg': s:Blue})
" call s:h('neosnippetWord',             {'fg': s:White})
" call s:h('neosnippetPlaceHolder',      {'fg': s:LightBlue})
" call s:h('neosnippetKeyword',          {'fg': s:Magenta})
" call s:h('neosnippetStatementAbbr',    {'fg': s:Magenta})
" call s:h('neosnippetStatementName',    {'fg': s:Magenta})
" call s:h('neosnippetStatementOptions', {'fg': s:Magenta})
" }}}

" Tmux: {{{
hi link tmuxComment Comment
hi link tmuxString String
hi link tmuxStringDelimiter String
call s:h('tmuxOptions',             {'fg': s:Magenta})
call s:h('tmuxFmtConditional',      {'fg': s:Magenta})
call s:h('tmuxOptsSet',             {'fg': s:YellowOrange})
call s:h('tmuxOptsSetw',            {'fg': s:YellowOrange})
call s:h('tmuxWindowPaneCmds',      {'fg': s:Yellow})
call s:h('tmuxAttrEquals',          {'fg': s:White})
call s:h('tmuxShellInpol',          {'fg': s:White})
call s:h('tmuxAttrSeparator',       {'fg': s:LightGray})
call s:h('tmuxFmtInpol',            {'fg': s:LightGray})
call s:h('tmuxSpecialCmds',         {'fg': s:Blue})
call s:h('tmuxFmtInpolDelimiter',   {'fg': s:Blue})
call s:h('tmuxAttrInpolDelimiter',  {'fg': s:Blue})
call s:h('tmuxShellInpolDelimiter', {'fg': s:Blue})
call s:h('tmuxURL',                 {'fg': s:LightBlue})
call s:h('tmuxColor',               {'fg': s:LightBlue})
call s:h('tmuxStyle',               {'fg': s:LightBlue})
call s:h('tmuxVariable',            {'fg': s:LightBlue})
call s:h('tmuxAttrBgFg',            {'fg': s:LightBlue})
call s:h('tmuxFmtVariable',         {'fg': s:LightBlue})
call s:h('tmuxKey',                 {'fg': s:Cyan})
call s:h('tmuxFmtAlias',            {'fg': s:Cyan})
call s:h('tmuxDateInpol',           {'fg': s:Cyan})
call s:h('tmuxKeySymbol',           {'fg': s:Cyan})
call s:h('tmuxOptionValue',         {'fg': s:Cyan})
" }}}

" Vimwiki: {{{
" call s:h('VimwikiHeaderChar', {'fg': s:Magenta})
" call s:h('VimwikiHeader1',    {'fg': s:Blue})
" call s:h('VimwikiHeader2',    {'fg': s:Blue})
" call s:h('VimwikiHeader3',    {'fg': s:Blue})
" call s:h('VimwikiHeader4',    {'fg': s:Blue})
" call s:h('VimwikiHeader5',    {'fg': s:Blue})
" call s:h('VimwikiHeader6',    {'fg': s:Blue})
" call s:h('VimwikiListTodo',   {'fg': s:White,  'bg': s:Green})
" call s:h('VimwikiH1Folding',  {'fg': s:White})
" }}}

" (lervag/wiki) {{{
" call s:h('wikiHeader1',         'fg': s:Blue})
" call s:h('wikiHeader2',         'fg': s:Blue})
" call s:h('wikiHeader3',         'fg': s:Blue})
" call s:h('wikiHeader4',         'fg': s:Blue})
" call s:h('wikiList',            'fg': s:BrightBlue})
" call s:h('wikiLine',            'fg': s:BrightBlue})
" call s:h('wikiLinkWiki',        'fg': s:LightBlue})
" call s:h('wikiLinkWikiConceal', {})
" }}}

" (jceb/vim-orgmode) {{{
" call s:h('hyperlink',             {'fg': s:LightBlue})
" call s:h('org_title',             {'fg': s:Cyan})
" call s:h('org_heading1',          {'fg': s:Magenta})
" call s:h('org_heading2',          {'fg': s:BrightBlue})
" call s:h('org_heading3',          {'fg': s:Green})
" call s:h('org_heading4',          {'fg': s:YellowOrange})
" call s:h('org_heading5',          {'fg': s:LightRed})
" call s:h('org_shade_stars',       {'fg': s:DarkGray})
" call s:h('org_list_item',         {'fg': s:BrightBlue})
" call s:h('org_list_unordered',    {'fg': s:BrightBlue})
" call s:h('org_list_ckeckbox',     {'fg': s:BrightBlue})
" call s:h('org_todo_keyword_done', {'fg': s:BrightBlue})
" }}}

" ==============================================================================
"  === Plugins ===
" ==============================================================================

" (w0rp/ale) {{{
call s:h('ALEInfo',             {})
call s:h('ALEError',            {})
call s:h('ALEWarning',          {})
call s:h('ALEStyleError',       {})
call s:h('ALEStyleWarning',     {})
call s:h('ALEInfoSign',         {'fg': s:LightGreen,   'bg': s:DarkGray})
call s:h('ALEErrorSign',        {'fg': s:LightRed,     'bg': s:DarkGray})
call s:h('ALEWarningSign',      {'fg': s:YellowOrange, 'bg': s:DarkGray})
call s:h('ALEStyleErrorSign',   {'fg': s:Yellow,       'bg': s:DarkGray})
call s:h('ALEStyleWarningSign', {'fg': s:Yellow,       'bg': s:DarkGray})
call s:h('ALEInfoLine',         {})
call s:h('ALEErrorLine',        {})
call s:h('ALEWarningLine',      {})
" }}}

" (neomake/neomake) {{{
hi link NeomakeErrorSign    ALEErrorSign
hi link NeomakeWarningSign  ALEWarningSign
hi link NeomakeMessagesSign ALEInfoSign
hi link NeomakeInfoSign     ALEInfoSign
" }}}

" (MattesGroeger/vim-bookmarks) {{{
" call s:h('BookmarkSign',           {'fg': s:Cyan, 'bg': s:DarkGray})
" call s:h('BookmarkAnnotationSign', {'fg': s:Cyan, 'bg': s:DarkGray})
" call s:h('BookmarkLine',           {})
" call s:h('BookmarkAnnotationLine', {})
" }}}

" (ap/vim-buftabline) {{{
call s:h('BufTabLineCurrent', {'fg': s:Black, 'bg': s:Green})
call s:h('BufTabLineActive',  {'fg': s:Green, 'bg': s:DarkGray})
call s:h('BufTabLineHidden',  {'fg': s:White, 'bg': s:DarkGray})
call s:h('BufTabLineFill',    {'bg': s:DarkGray})
" }}}

" Cheat40: {{{
" call s:h('Cheat40Descr',        {})
" call s:h('Cheat40Command',      {'fg': s:LightBlue})
" call s:h('Cheat40Header',       {'fg': s:BrightBlue})
" call s:h('Cheat40Divider',      {'fg': s:BrightBlue})
" call s:h('Cheat40About',        {})
" call s:h('Cheat40FirstLine',    {'fg': s:Magenta})
" call s:h('Cheat40BeginSection', {})
" call s:h('Cheat40EndSection',   {})
" call s:h('Cheat40Tag',          {'fg': s:Green})
" call s:h('Cheat40Backtick',     {'fg': s:Green})
" call s:h('Cheat40Mode',         {'fg': s:Cyan})
" call s:h('Cheat40Angle',        {'fg': s:Green})
" call s:h('Cheat40DblAngle',     {'fg': s:YellowOrange})
" call s:h('Cheat40Comment',      {'fg': s:BrightBlue,   'gui': 'italic'})
" call s:h('Cheat40Hash',         {'fg': s:White,        'gui': 'none'})
" call s:h('Cheat40Runtime',      {})
" }}}

" (Shougo/denite.nvim) {{{
call s:h('deniteMatchedChar',   {'fg': s:Cyan, 'gui': 'underline'})
" call s:h('deniteMatchedRange', {})
call s:h('denitePrompt',        {'fg': s:Cyan})
call s:h('deniteConcealedMark', {'fg': s:DarkBlue})
call s:h('deniteModeNormal',    {'fg': s:Green})
call s:h('deniteModeInsert',    {'fg': s:Green})
call s:h('deniteSource_Projectile_Name',   {'fg': s:Cyan})
" }}}

" (airblade/vim-gitgutter) {{{
call s:h('GitGutterAdd',              {'fg': s:Green,        'bg': s:DarkGray})
call s:h('GitGutterChange',           {'fg': s:YellowOrange, 'bg': s:DarkGray})
call s:h('GitGutterDelete',           {'fg': s:LightRed,     'bg': s:DarkGray})
call s:h('GitGutterChangeDelete',     {'fg': s:YellowOrange, 'bg': s:DarkGray})
call s:h('GitGutterAddLine',          {})
call s:h('GitGutterChangeLine',       {})
call s:h('GitGutterDeleteLine',       {})
call s:h('GitGutterChangeDeleteLine', {})
" }}}

" (junegunn/vim-github-dashboard) {{{
call s:h('githubNumber',  {'fg': s:LightGreen})
call s:h('githubTime',    {'fg': s:LightGray})
call s:h('githubUser',    {'fg': s:Blue})
call s:h('githubBranch',  {'fg': s:Magenta})
call s:h('githubRepo',    {'fg': s:Orange})
call s:h('githubSHA',     {'fg': s:LightGreen})
call s:h('githubKeyword', {'fg': s:Cyan})
call s:h('githubCommit',  {'fg': s:Cyan})
call s:h('githubRelease', {'fg': s:Cyan})
call s:h('githubTag',     {'fg': s:Cyan})
call s:h('githubEdit',    {'fg': s:Cyan})
call s:h('githubGist',    {'fg': s:Cyan})
" }}}

" (hecal3/vim-leader-guide) {{{
" call s:h('LeaderGuideKeys',     {'fg': s:Cyan})
" call s:h('LeaderGuideBrackets', {'fg': s:Gray})
" call s:h('LeaderGuideDesc',     {'fg': s:Blue})
" }}}

" (justinmk/vim-sneak) {{{
" call s:h('Sneak',      {'fg': s:nop, 'bg': s:Gray})
" call s:h('SneakScope', {'fg': s:nop, 'bg': s:Gray})
" call s:h('SneakLabel', {'fg': s:nop, 'bg': s:Cyan})
" }}}

" (mhinz/vim-startify) {{{
call s:h('StartifyFile',    {'fg': s:Cyan})
call s:h('StartifyBracket', {'fg': s:Black})
call s:h('StartifyNumber',  {'fg': s:LightGreen,})
call s:h('StartifyVar',     {'fg': s:LightGreen,})
call s:h('StartifySpecial', {'fg': s:LightGreen,})
call s:h('StartifySlash',   {'fg': s:Gray})
call s:h('StartifyPath',    {'fg': s:Gray})
call s:h('StartifySelect',  {})
call s:h('StartifyHeader',  {})
call s:h('StartifySection', {'fg': s:Magenta})
" }}}

" (pelodelfuego/vim-swoop) {{{
call s:h('SwoopBufferLineHi',{})
call s:h('SwoopPatternHi',   {})
" }}}

" (majutsushi/tagbar) {{{
call s:h('TagbarHelp',       {'fg': s:Gray})
call s:h('TagbarHelpKey',    {'fg': s:LightGray})
call s:h('TagbarHelpTitle',  {'fg': s:Violet})
call s:h('TagbarKind',       {'fg': s:Cyan})
call s:h('TagbarNestedKind', {'fg': s:LightGreen})
call s:h('TagbarScope',      {'fg': s:Yellow})
call s:h('TagbarType',       {'fg': s:Cyan})
" call s:h('TagbarParens',     {'fg': s:Cyan})
hi link TagbarParens Normal
call s:h('TagbarSignature',  {'fg': s:LightBlue})
call s:h('TagbarPseudoID',   {'fg': s:Magenta})
" call s:h('TagbarFoldIcon',   {'fg': s:White})
call s:h('TagbarFunc',       {'fg': s:Yellow})
call s:h('TagbarSection',    {'fg': s:Magenta, 'gui': 'bold'})
" call s:h('TagbarHighlight' {})
" }}}

" (Shougo/unite.vim) {{{
call s:h('uniteStatusNormal',             {'fg': s:Green})
call s:h('uniteStatusInsert',             {'fg': s:Blue})
" call s:h('uniteStatusSourceNames',      {'fg': s:Cyan})
" call s:h('uniteStatusMessage',          {'fg': s:Green})
" call s:h('uniteStatusSourceCandidates', {'fg': s:Yellow})
" call s:h('uniteStatusHead',             {'fg': s:YellowOrange})
call s:h('unitePrompt',                   {'fg': s:Cyan})
" call s:h('uniteStatusLineNR',           {'fg': s:Gray})
" }}}

" (romgrk/vimfiler-prompt) {{{
call s:h('FilerCursor',              {'fg': s:Gray})
call s:h('FilerSelected',            {'fg': s:Gray})
call s:h('FilerActive',              {'fg': s:Gray})
call s:h('FilerMatch',               {})
call s:h('FilerNoMatch',             {})
call s:h('FilerPrompt',              {'fg': s:Cyan})
call s:h('FilerInput',               {'fg': s:Gray})
call s:h('FilerCompletion',          {'fg': s:Gray})
" ' (Shougo/vimfiler)
call s:h('vimfilerStatus',           {})
call s:h('vimfilerColumn__devicons', {'fg': s:LightGray})
call s:h('vimfilerDirectory',        {'fg': s:Blue})
call s:h('vimfilerCurrentDirectory', {'fg': s:Cyan,     'gui':  'italic'})
call s:h('vimfilerMask',             {'fg': s:Blue})
call s:h('vimfilerMark',             {'fg': s:Green})
call s:h('vimfilerNonMark',          {'fg': s:White})
call s:h('vimfilerLeaf',             {'fg': s:Blue})
call s:h('vimfilerNormalFile',       {'fg': s:White})
call s:h('vimfilerOpenedFile',       {'fg': s:LightBlue})
call s:h('vimfilerClosedFile',       {'fg': s:Blue})
call s:h('vimfilerMarkedFile',       {'fg': s:Green})
call s:h('vimfilerROFile',           {'fg': s:LightGray})
" }}}
