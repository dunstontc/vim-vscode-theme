" ==============================================================================
" FILE: Dark Plus Vim
" Author: Clay Dunston <dunstontc@gmail.com>
" License: MIT License
" Last Modified: 2018-01-23
" ==============================================================================

" Setup: {{{
scriptencoding utf-8

if exists("syntax on")
    syntax reset
endif

hi clear
let g:colors_name="dark_plus"
set background=dark

if ! exists("g:dark_plus_termcolors")
  let g:dark_plus_termcolors = 256
endif

if ! exists("g:dark_plus_terminal_italics")
  let g:dark_plus_terminal_italics = 1
endif

" shamelessly stolen from challenger-deep,
" shamelessly stolen from hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:dark_plus_terminal_italics == 0 && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
    unlet a:style.cterm
  endif
  if g:dark_plus_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction
" }}}


" ==============================================================================
" Base Colors: {{{
let s:DarkGray =     { "gui": "#505050", "cterm16": "07", "cterm": "08"  }
let s:Gray =         { "gui": "#808080", "cterm16": "07", "cterm": "08"  }
let s:VeryDarkGray = { "gui": "#303030", "cterm16": "07", "cterm": "234" }

let s:Red =          { "gui": "#F44747", "cterm16": "01", "cterm": "203" }
let s:LightRed =     { "gui": "#D16969", "cterm16": "01", "cterm": "167" }
let s:Orange =       { "gui": "#CE9178", "cterm16": "03", "cterm": "173" }
let s:YellowOrange = { "gui": "#D7BA7D", "cterm16": "03", "cterm": "179" }
let s:Yellow =       { "gui": "#DCDCAA", "cterm16": "03", "cterm": "187" }
let s:Green =        { "gui": "#608B4E", "cterm16": "02", "cterm": "65"  }
let s:LightGreen =   { "gui": "#B5CEA8", "cterm16": "09", "cterm": "151" }
let s:Blue =         { "gui": "#569CD6", "cterm16": "04", "cterm": "75"  }
let s:LightBlue =    { "gui": "#9CDCFE", "cterm16": "06", "cterm": "117" }
let s:DarkBlue =     { "gui": "#223E55", "cterm16": "04", "cterm": "73"  }
let s:BrightBlue =   { "gui": "#007ACC", "cterm16": "04", "cterm": "73"  }
let s:Cyan =         { "gui": "#4EC9B0", "cterm16": "06", "cterm": "43"  }
let s:Pink =         { "gui": "#C586C0", "cterm16": "13", "cterm": "176" }
let s:Violet =       { "gui": "#646695", "cterm16": "07", "cterm": "60"  }

call s:h("DarkGray",     {"fg": s:DarkGray})
call s:h("VeryDarkGray", {"fg": s:VeryDarkGray})
call s:h("BrightBlue",   {"fg": s:BrightBlue})
call s:h("Selection",    {"fg": s:Selection})
call s:h("Gray",         {"fg": s:Gray})
call s:h("Violet",       {"fg": s:Violet})
call s:h("Blue",         {"fg": s:Blue})
call s:h("DarkBlue",     {"fg": s:DarkBlue})
call s:h("LightBlue",    {"fg": s:LightBlue})
call s:h("Green",        {"fg": s:Green})
call s:h("Cyan",         {"fg": s:Cyan})
call s:h("LightGreen",   {"fg": s:LightGreen})
call s:h("Red",          {"fg": s:Red})
call s:h("Orange",       {"fg": s:Orange})
call s:h("LightRed",     {"fg": s:LightRed})
call s:h("YellowOrange", {"fg": s:YellowOrange,})
call s:h("Yellow",       {"fg": s:Yellow})
call s:h("Pink",         {"fg": s:Pink})

" call s:h("Cursor",        {"bg": s:bg_dark, "fg": s:norm })
" call s:h("Comment",       {"fg": s:medium_gray, "gui": "italic", "cterm": "italic"})
call s:h("cdNop",  {"fg": s:cdNop, "bg": s:cdNop})
call s:h("Escape", {"fg": s:YellowOrange})
" }}}

" ===============================================================================
" Terminal Colors: {{{
" let g:terminal_color_0 = s:bg_dark.gui
" let g:terminal_color_1 = s:red.gui
" let g:terminal_color_2 = s:green.gui
" let g:terminal_color_3 = s:yellow.gui
" let g:terminal_color_4 = s:blue.gui
" let g:terminal_color_5 = s:purple.gui
" let g:terminal_color_6 = s:cyan.gui
" let g:terminal_color_7 = s:clouds.gui
" let g:terminal_color_8 = s:bg_subtle.gui
" let g:terminal_color_9 = s:dark_red.gui
" let g:terminal_color_10 = s:dark_green.gui
" let g:terminal_color_11 = s:dark_yellow.gui
" let g:terminal_color_12 = s:dark_blue.gui
" let g:terminal_color_13 = s:dark_purple.gui
" let g:terminal_color_14 = s:dark_cyan.gui
" let g:terminal_color_15 = s:dark_clouds.gui

" call s:h("TermCursor",     s:Green,      s:VeryDarkGray,
" let s:head_a         = s:dark_blue
" let s:head_b         = s:blue
" let s:head_c         = s:dark_cyan
" }}}

" ===============================================================================
" General Appearance Colors: {{{
" (some may be unused)
" ===============================================================================

let s:cdNone =               { "gui": "NONE",    "cterm16": "NONE", "cterm": "NONE"}
let s:cdNop =                { "gui": "NONE",    "cterm16": "NONE", "cterm": "NONE"}
let s:cdFront =              { "gui": "#D4D4D4", "cterm16": "07",   "cterm": "188" }
let s:cdBack =               { "gui": "#1E1E1E", "cterm16": "00",   "cterm": "234" }

let s:cdTabCurrent =         { "gui": "#1E1E1E", "cterm16": "00", "cterm": "234" }
let s:cdTabOther =           { "gui": "#2D2D2D", "cterm16": "00", "cterm": "236" }
let s:cdTabOutside =         { "gui": "#252526", "cterm16": "00", "cterm": "235" }

let s:cdLeftDark =           { "gui": "#252526", "cterm16": "00", "cterm": "235" }
let s:cdLeftMid =            { "gui": "#373737", "cterm16": "08", "cterm": "237" }
let s:cdLeftLight =          { "gui": "#3F3F46", "cterm16": "08", "cterm": "238" }

let s:cdPopupFront =         { "gui": "#BBBBBB", "cterm16": "07", "cterm": "250" }
let s:cdPopupBack =          { "gui": "#2D2D30", "cterm16": "07", "cterm": "236" }
let s:cdPopupHighlightBlue = { "gui": "#073655", "cterm16": "04", "cterm": "24"  }
let s:cdPopupHighlightGray = { "gui": "#3D3D40", "cterm16": "08", "cterm": "237" }

let s:cdSplitLight =         { "gui": "#898989", "cterm16": "07", "cterm": "245" }
let s:cdSplitDark =          { "gui": "#444444", "cterm16": "08", "cterm": "238" }
let s:cdSplitThumb =         { "gui": "#424242", "cterm16": "07", "cterm": "238" }

let s:cdCursorDarkDark =     { "gui": "#222222", "cterm16": "00", "cterm": "235" }
let s:cdCursorDark =         { "gui": "#51504F", "cterm16": "08", "cterm": "239" }
let s:cdCursorLight =        { "gui": "#AEAFAD", "cterm16": "07", "cterm": "145" }
let s:Selection =            { "gui": "#264F78", "cterm16": "08", "cterm": "24"  }
let s:cdLineNumber =         { "gui": "#5A5A5A", "cterm16": "07", "cterm": "240" }

let s:cdDiffRedDark =        { "gui": "#4B1818", "cterm16": "01", "cterm": "52"  }
let s:cdDiffRedLight =       { "gui": "#6F1313", "cterm16": "01", "cterm": "52"  }
let s:cdDiffRedLightLight =  { "gui": "#FB0101", "cterm16": "01", "cterm": "09"  }
let s:cdDiffGreenDark =      { "gui": "#373D29", "cterm16": "01", "cterm": "237" }
let s:cdDiffGreenLight =     { "gui": "#4B5632", "cterm16": "09", "cterm": "58"  }

let s:cdSearchCurrent =      { "gui": "#49545F", "cterm16": "09", "cterm": "239" }
let s:cdSearch =             { "gui": "#4C4E50", "cterm16": "03", "cterm": "239" }
" }}}


" ==============================================================================
" Vim Default Colors: {{{
" ==============================================================================
call s:h("Normal",         {"bg": s:cdBack       })
call s:h("NormalNC",       {"bg": s:VeryDarkGray})
call s:h("ColorColumn",    {"bg": s:VeryDarkGray})
call s:h("iCursor",        { "bg": s:Blue})
call s:h("vCursor",        { "bg": s:Pink})
call s:h("rCursor",        { "bg": s:LightRed})
" call s:h("lCursor",      { "bg": s:Blue})
call s:h("Cursor",         { "bg": s:Green})
call s:h("CursorLine",     { "bg": s:VeryDarkGray,})
call s:h("Directory",      { "fg": s:Blue})
call s:h("DiffAdd",        { "bg": s:cdDiffGreenDark })
hi link diffAdded DiffAdd
call s:h("DiffChange",      {"bg": s:cdDiffRedDark  })
call s:h("DiffDelete",      {"bg": s:cdDiffRedLight })
call s:h("DiffText",        {"bg": s:cdDiffRedLight })
call s:h("EndOfBuffer",     {"fg": s:cdBack,            "bg": s:VeryDarkGray })
call s:h("ErrorMsg",        {"fg": s:LightRed,          "bg": s:cdNop })
call s:h("VertSplit",       {"fg": s:cdBack,            "bg": s:VeryDarkGray })
call s:h("Folded",          {"fg": s:DarkGray,        "bg": s:cdNop })
call s:h("FoldColumn",      {"fg": s:cdBack,            "bg": s:VeryDarkGray })
call s:h("SignColumn",      {"bg": s:VeryDarkGray })
call s:h("IncSearch",       {"fg": s:cdNone,            "bg": s:Selection })
call s:h("LineNr",          {"fg": s:cdLineNumber,      "bg": s:VeryDarkGray })
call s:h("CursorLineNr",    {"fg": s:Green,             "bg": s:VeryDarkGray })
call s:h("MatchParen",      {"fg": s:cdCursorDark,      "gui": "underline", "cterm": "italic"})
" (valloric/matchtagalways)
hi link matchTag MatchParen
call s:h("ModeMsg",        {"fg": s:Gray,})
call s:h("MoreMsg",        {"fg": s:cdFront,})
call s:h("NonText",        {"fg": s:cdLineNumber, "bg": s:cdNop})
call s:h("Pmenu",          {"fg": s:cdPopupFront, "bg": s:cdPopupBack})
call s:h("PmenuSel",       {"fg": s:cdPopupFront, "bg": s:cdPopupHighlightBlue,})
call s:h("PmenuSbar",      {"bg": s:cdPopupHighlightGray,})
call s:h("PmenuThumb",     {"bg": s:cdPopupFront})
call s:h("Question",       {"fg": s:Cyan,  "bg": s:cdNop})
call s:h("Search",         {"fg": s:cdNone,       "bg": s:Selection})
call s:h("Substitute",     {"fg": s:cdNone,       "bg": s:Selection})
call s:h("SpellBad",       {"fg": s:LightRed,   "bg": s:cdNone})
call s:h("SpellCap",       {"fg": s:LightRed,   "bg": s:cdNone})
call s:h("SpellLocal",     {"fg": s:LightRed,   "bg": s:cdNone})
call s:h("StatusLine",     {"fg": s:cdFront,      "bg": s:cdNop})
call s:h("StatusLineNC",   {"fg": s:cdNop,        "bg": s:cdNop})
call s:h("TabLine",        {"fg": s:cdFront,      "bg": s:cdTabOther,          "gui": "italic"})
call s:h("TabLineFill",    {"fg": s:cdFront,      "bg": s:cdTabOutside,        "gui": "italic"})
call s:h("TabLineSel",     {"fg": s:cdFront,      "bg": s:cdTabCurrent})
call s:h("Title",          {"fg": s:Blue,       "gui": "bold"})
call s:h("Visual",         {"fg": s:cdNone,       "bg": s:Selection,})
call s:h("VisualNOS",      {"fg": s:cdNone,       "bg": s:Selection,})
call s:h("WarningMsg",     {"fg": s:Orange})
call s:h("WildMenu",       {"fg": s:cdFront,      "bg": s:Selection,})

call s:h("Comment",        {"fg": s:DarkGray, "gui": "italic"})
call s:h("SpecialComment", {"fg": s:Green,      "gui": "italic"})
call s:h("SpecialKey",     {"fg": s:Green,      "gui": "none"})

call s:h("Constant",       {"fg": s:Blue})
call s:h("Boolean",        {"fg": s:Blue})
call s:h("String",         {"fg": s:Orange})
call s:h("Character",      {"fg": s:Orange})
call s:h("Number",         {"fg": s:LightGreen})
call s:h("Float",          {"fg": s:LightGreen})

call s:h("Identifier",     {"fg": s:LightBlue,})
call s:h("Function",       {"fg": s:Yellow})

call s:h("Statement",      {"fg": s:Pink})
call s:h("Conditional",    {"fg": s:Pink})
call s:h("Repeat",         {"fg": s:Pink})
call s:h("Label",          {"fg": s:Pink})
call s:h("Keyword",        {"fg": s:Pink})
call s:h("Exception",      {"fg": s:Pink})
call s:h("PreProc",        {"fg": s:Blue})
call s:h("Include",        {"fg": s:Pink})
call s:h("Define",         {"fg": s:Pink})
call s:h("Macro",          {"fg": s:Pink})
call s:h("PreCondit",      {"fg": s:Pink})
call s:h("Type",           {"fg": s:Cyan})
call s:h("Typedef",        {"fg": s:Cyan})
call s:h("StorageClass",   {"fg": s:Blue})
call s:h("Structure",      {"fg": s:Blue})
call s:h("Operator",       {"fg": s:cdFront})
call s:h("Special",        {"fg": s:cdFront})
call s:h("SpecialChar",    {"fg": s:cdFront})
call s:h("Delimiter",      {"fg": s:cdFront})
call s:h("Debug",          {"fg": s:BrightBlue, "bg": s:LightRed,})
call s:h("Tag",            {"fg": s:Green})
call s:h("Underlined",     {"fg": s:cdNone,     "gui": "underline"})
call s:h("Conceal",        {"fg": s:cdFront,      "bg": s:cdBack})
call s:h("Ignore",         {})
call s:h("Error",          {"fg": s:LightRed})
call s:h("Todo",           {"fg": s:cdFront,      "bg": s:Green,  "gui": "bold,italic"})

" Help: {{{
call s:h("helpHeadline",       {"fg": s:Pink})
call s:h("helpHeader",         {"fg": s:Pink})
call s:h("helpHyperTextEntry", {"fg": s:Blue})
call s:h("helpHyperTextJump",  {"fg": s:LightBlue})
call s:h("helpSectionDelim",   {"fg": s:BrightBlue})
call s:h("helpExample",        {"fg": s:Orange})
call s:h("helpSpecial",        {"fg": s:Cyan})
call s:h("helpURL",            {"fg": s:LightBlue})
" call s:h("helpBar",            {})
" call s:h("helpNote",           {})
" call s:h("helpOption",         {})
call s:h("helpCommand",        {"fg": s:Yellow})
" }}}

" Quickfix: {{{
call s:h("qfFileName",         {"fg": s:Blue})
call s:h("qfLineNr",           {"fg": s:LightGreen})
" }}}
" }}}

" ===============================================================================
"  Languages & Filetypes
" ===============================================================================

" C: {{{
hi link cSpecialCharacter Escape
" }}}

" C# {{{
hi link csInterpolation Identifier
hi link csNew Constant
call s:h("csThis",      {"fg": s:Blue,   "gui": "italic"})
hi link csInterpolationDelim Constant
hi link csDocComment SpecialComment
hi link csDocExample Identifier
hi link csDocString Identifier
hi link csOperator Conditional
hi link csModifier Conditional
hi link csLinqKeyword Conditional
" }}}

" CSS: {{{
hi link cssBraces Gray
hi link cssNoise  DarkGray
call s:h("cssInclude",         {"fg": s:Pink})
call s:h("cssTagName",         {"fg": s:YellowOrange})
call s:h("cssClassName",       {"fg": s:YellowOrange})
hi link cssClassNameDot DarkGray
call s:h("cssPseudoClass",     {"fg": s:YellowOrange})
call s:h("cssPseudoClassId",   {"fg": s:YellowOrange})
call s:h("cssPseudoClassLang", {"fg": s:YellowOrange})
call s:h("cssIdentifier",      {"fg": s:YellowOrange})
call s:h("cssProp",            {"fg": s:LightBlue})
hi link cssDefinition Identifier
call s:h("cssAttr",            {"fg": s:Orange})
hi link cssAttrRegion String
hi link cssColor String
call s:h("cssFunction",        {"fg": s:Orange})
hi link cssFunctionName Function
call s:h("cssVendor",          {"fg": s:Orange})
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
call s:h("gitcommitBranch",    {"fg": s:Pink})
call s:h("gitcommitUntracked", {"fg": s:YellowOrange,})
hi link gitcommitWarning WarningMsg
" call s:h("gitcommitDiscarded", {"fg": s:Pink})
call s:h("gitconfigNone",      {"fg": s:cdFront})
call s:h("gitconfigEscape",    {"fg": s:YellowOrange})
" }}}

" " Golang: {{{
call s:h("goPackageName",           {"fg": s:cdFront,     "gui": "italic"})
call s:h("goMain",                  {"fg": s:cdFront})
hi link goStatement Conditional
hi link goOperator Conditional
call s:h("goPackage",               {"fg": s:Blue})
" call s:h("goImport",                s:Blue})
call s:h("goVar",                   {"fg": s:Blue})
hi link goConst Constant
hi link goImport Conditional
" hi link goFormatSpecifier Identifier
" " call s:h("goType",                  s:Blue})
" " hi link goType Type
hi link goFloats Type
hi link goArgumentType Type
call s:h("goType",                  {"fg": s:Cyan,   "gui": "italic"})
call s:h("goFloats",                {"fg": s:Cyan,   "gui": "italic"})
call s:h("goArgumentType",          {"fg": s:Cyan})
" " hi link goSimpleArguments cdNop
call s:h("goSignedInts",            {"fg": s:Cyan, "gui": "italic"})
call s:h("goUnsignedInts",          {"fg": s:Cyan, "gui": "italic"})
call s:h("goComplexes",             {"fg": s:Blue})
hi link goBoolean Boolean
call s:h("goPredefinedIdentifiers", {"fg": s:Blue})
call s:h("goDeclaration",           {"fg": s:Blue})
call s:h("goDeclType",              {"fg": s:Blue})
call s:h("goTypeDecl",              {"fg": s:Blue})
hi link goTodo Todo
hi link goComment Comment
hi link goDocComment SpecialComment
" hi link goDocComment Comment
hi link goPackageComment Comment
call s:h("goCommentEmphasis",       {"fg": s:YellowOrange})
call s:h("goTypeName",              {"fg": s:Cyan})
call s:h("goVarAssign",             {"fg": s:LightBlue})
call s:h("goVarDefs",               {"fg": s:LightBlue})
call s:h("goSingleDecl",            {"fg": s:LightBlue})
call s:h("goReceiver",              {"fg": s:cdFront})
call s:h("goReceiverVar",           {"fg": s:LightBlue})
call s:h("goReceiverType",          {"fg": s:Cyan})
call s:h("goFunctionCall",          {"fg": s:Yellow})
call s:h("goMethodCall",            {"fg": s:Yellow})
call s:h("goBuiltins",              {"fg": s:Yellow})
hi link goEscapeC vimCtrlChar
" }}}

" HTML: {{{
call s:h("htmlHead",           {"fg": s:Gray})
call s:h("htmlTitle",          {"fg": s:cdFront})
call s:h("htmlTag",            {"fg": s:Gray})
call s:h("htmlEndTag",         {"fg": s:Gray})
call s:h("htmlTagName",        {"fg": s:Blue})
call s:h("htmlSpecialTagName", {"fg": s:Blue})
call s:h("htmlArg",            {"fg": s:LightBlue})
call s:h("htmlBold",           {"fg": s:Pink})
call s:h("htmlItalic",         {"fg": s:Cyan, "gui": "italic"})
hi link htmlComment Comment
hi link xmlAttrib   htmlArg
hi link xmlTagName  htmlTagName
hi link xmlEndTag   htmlTagName
hi link xmlTag      htmlTag
hi link xmlEqual    htmlTag
" }}}

" JavaScript: {{{
call s:h("jsFuncCall",           {"fg": s:Yellow})
call s:h("jsVariableDef",        {"fg": s:LightBlue})
call s:h("jsParen",              {"fg": s:LightBlue})
call s:h("jsParenRepeat",        {"fg": s:LightBlue})
call s:h("jsParenSwitch",        {"fg": s:LightBlue})
call s:h("jsParenIfElse",        {"fg": s:LightBlue})
call s:h("jsSwitchColon",        {"fg": s:Pink})
call s:h("jsSpecial",            {"fg": s:YellowOrange})
call s:h("jsFuncArgs",           {"fg": s:LightBlue})
call s:h("jsRegexpString",       {"fg": s:LightRed})
call s:h("jsThis",               {"fg": s:Blue,         "gui": "italic"})
call s:h("jsTemplateBraces",     {"fg": s:Blue})
hi link jsNoise Normal
call s:h("jsGlobalObjects",      {"fg": s:Cyan})
" call s:h("jsGlobalNodeObjects",  {"fg": s:Cyan})
hi link jsFunction Function
hi link jsObjectKey Identifier
hi link jsClassDefinition Type
hi link jsOperator Conditional
hi link jsExtendsKeyword Conditional
hi link jsClassKeyword Boolean
call s:h("jsObjectProp",         {"fg": s:Cyan})
call s:h("jsObjectStringKey",    {"fg": s:LightBlue})
call s:h("jsTemplateString",     {"fg": s:Orange})
call s:h("jsTemplateExpression", {"fg": s:LightBlue})
" }}}

" JSON:
" (elzr/vim-json) {{{
call s:h("jsonKeyword",      {"fg": s:LightBlue})
call s:h("jsonKeywordMatch", {"fg": s:DarkGray})
call s:h("jsonBraces",       {"fg": s:DarkGray})
call s:h("jsonNoise",        {"fg": s:DarkGray})
call s:h("jsonQuote",        {"fg": s:DarkGray})
call s:h("jsonString",       {"fg": s:Orange})
" (Quramy/vison)
call s:h("jsonCommentError", {"fg": s:Gray})
call s:h("jsonEscape",       {"fg": s:YellowOrange})
call s:h("jsonFold",         {"fg": s:DarkGray})
" }}}

" Lua:
" (tbastos/vim-lua) {{{
call s:h("luaFunc",           {})
call s:h("luaComma",          {})
call s:h("luaFuncParens",     {})
call s:h("luaSymbolOperator", {})
call s:h("luaBraces",         {"fg": s:cdFront})
call s:h("luaFuncName",       {"fg": s:Yellow})
call s:h("luaString",         {"fg": s:Orange})
call s:h("luaFuncKeyword",    {"fg": s:Pink})
call s:h("luaTable",          {})
call s:h("luaFuncSig",        {})
call s:h("luaFuncArg",        {"fg": s:LightBlue})
call s:h("luaFuncArgName",    {"fg": s:LightBlue})
" }}}

" Markdown:
" (tpope/vim-markdown) {{{
call s:h("markdownH1",               {"fg": s:Blue})
call s:h("markdownH2",               {"fg": s:Blue})
call s:h("markdownH3",               {"fg":  s:Blue})
call s:h("markdownH4",               {"fg":  s:Blue})
call s:h("markdownH5",               {"fg":  s:Blue})
call s:h("markdownH6",               {"fg":  s:Blue})
call s:h("markdownHeadingDelimiter", {"fg":  s:Blue})
call s:h("markdownItalic",           {"fg":  s:LightBlue, "gui": "italic"})
call s:h("markdownItalicDelimiter",  {"fg":  s:DarkGray})
call s:h("markdownBold",             {"fg":  s:Pink,      "gui": "bold"})
call s:h("markdownBoldDelimiter",    {"fg":  s:DarkGray})
call s:h("markdownListMarker",       {"fg":  s:BrightBlue})
call s:h("markdownCode",             {"fg":  s:Orange})
call s:h("markdownCodeDelimiter",    {"fg":  s:DarkGray})
call s:h("markdownUrl",              {"fg":  s:DarkGray})
call s:h("markdownLinkText",         {"fg":  s:LightBlue})
call s:h("markdownLinkTextDelimiter",{"fg":  s:DarkGray})
call s:h("markdownLinkDelimiter",    {"fg":  s:DarkGray})
call s:h("markdownBlockquote",       {"fg":  s:Green})
" }}}

" (plasticboy/vim-markdown) {{{
call s:h("mkdItalic",           {"gui": "italic"})
call s:h("mkdBold",             {"gui": "bold"})
call s:h("mkdBoldItalic",       {"gui": "bold,italic"})
call s:h("mkdFootnotes",        {})
call s:h("mkdFootnote",         {})
call s:h("mkdID",               {})
call s:h("mkdURL",              {"fg": s:Orange})
call s:h("mkdLink",             {"fg": s:LightBlue,})
call s:h("mkdInlineURL",        {"fg": s:Orange})
call s:h("mkdLinkDefTarget",    {"fg": s:LightBlue,})
call s:h("mkdLinkDef",          {"fg": s:LightBlue,})
call s:h("mkdLinkTitle",        {"fg": s:LightBlue,})
call s:h("mkdLineBreak",        {})
call s:h("mkdBlockquote",       {"fg": s:Green})
call s:h("mkdCode",             {"fg": s:Orange})
call s:h("mkdListItem",         {"fg": s:BrightBlue,})
call s:h("mkdListItemLine",     {})
call s:h("mkdNonListItemBlock", {})
call s:h("mkdRule",             {"fg": s:Pink})
call s:h("mkdDelimiter",        {"fg": s:DarkGray})
" }}}

" Perl:{{{
hi link perlSpecialString Escape
hi link perlVarMember Type
"}}}

" Python: {{{
call s:h("pythonRun",             {"fg": s:Blue})
call s:h("pythonCoding",          {"fg": s:Blue})
call s:h("pythonClassName",       {"fg": s:Cyan})
call s:h("pythonClassVar",        {"fg": s:Blue,         "gui": "italic"})
call s:h("pythonCommentTitle",    {"fg": s:Green})
call s:h("pythonDot",             {"fg": s:LightBlue})
call s:h("pythonAttribute",       {"fg": s:LightBlue})
call s:h("pythonFunction",        {"fg": s:Yellow})
call s:h("pythonBuiltinFunc",     {"fg": s:Blue})
call s:h("pythonBuiltinObj",      {"fg": s:Cyan})
call s:h("pythonInclude",         {"fg": s:Pink})
call s:h("pythonOperator",        {"fg": s:Pink})
call s:h("pythonStatement",       {"fg": s:Pink})
call s:h("pythonNumber",          {"fg": s:LightGreen})
call s:h("pythonString",          {"fg": s:Orange})
call s:h("pythonRawString",       {"fg": s:Orange})
call s:h("pythonFString",         {"fg": s:Orange})
call s:h("pythonStrFormat",       {"fg": s:LightBlue})
call s:h("pythonStrInterpRegion", {"fg": s:LightBlue})
call s:h("pythonStrFormatting",   {"fg": s:YellowOrange})
call s:h("pythonStrTemplate",     {"fg": s:LightBlue})
call s:h("pythonEscape",          {"fg": s:YellowOrange})
call s:h("pythonRawEscape",       {"fg": s:YellowOrange})
call s:h("pythonUniEscape",       {"fg": s:YellowOrange})
call s:h("pythonBytesEscape",     {"fg": s:YellowOrange})
call s:h("pythonTrippleQuotes",   {"fg": s:Green})
call s:h("pythonDocString",       {"fg": s:Green})
call s:h("pythonComment",         {"fg": s:DarkGray,     "gui": "italic"})
" (tweekmonster/impsort.vim)
call s:h("pythonImport",          {"fg": s:Pink})
call s:h("pythonIncludeLine",     {"fg": s:Cyan})
call s:h("pythonImportedModule",  {"fg": s:LightBlue})
call s:h("pythonImportedObject",  {"fg": s:Cyan})
call s:h("pythonImportedFuncDef", {"fg": s:Yellow})
call s:h("impsortNonImport",      {"fg": s:LightBlue})
" }}}

" Ruby: {{{
call s:h("rubyClassNameTag", {"fg": s:Cyan})
" }}}

" Sh: {{{
call s:h("shFunction",          {"fg": s:Yellow})
call s:h("shFunctionKey",       {"fg": s:Pink})
call s:h("shFunctionOne",       {"fg": s:cdFront})
call s:h("shFunctionTwo",       {"fg": s:cdFront})
call s:h("shFunctionStatement", {"fg": s:Pink})
call s:h("shEscape",            {"fg": s:YellowOrange})
call s:h("shSpecial",           {"fg": s:YellowOrange})
call s:h("shConditional",       {"fg": s:Pink})
call s:h("shCommandSub",        {})
call s:h("shCmdParenRegion",    {})
call s:h("shCmdSubRegion",      {})
call s:h("shQuote",             {"fg": s:Orange})
call s:h("shDoubleQuote",       {"fg": s:Orange})
call s:h("shOption",            {"fg": s:Pink})
call s:h("shStatement",         {"fg": s:Blue})
call s:h("shDeref",             {"fg": s:cdFront})
call s:h("shDerefVar",          {"fg": s:LightBlue})
call s:h("shDerefSpecial",      {"fg": s:LightBlue})
call s:h("shDerefPattern",      {"fg": s:LightRed})
call s:h("shDerefOp",           {"fg": s:LightRed})
call s:h("shDerefSimple",       {"fg": s:LightBlue})
call s:h("shDerefVarArray",     {"fg": s:LightBlue})
call s:h("shRepeat",            {"fg": s:LightBlue})
call s:h("shFor",               {"fg": s:LightBlue})
call s:h("shCtrlSeq",           {"fg": s:Cyan})
call s:h("shOperator",          {"fg": s:cdFront})
call s:h("shTestOpr",           {"fg": s:cdFront})
call s:h("shExpr",              {"fg": s:cdFront})
call s:h("shIf",                {"fg": s:Pink})
call s:h("shDo",                {"fg": s:Pink})
call s:h("shLoop",              {"fg": s:Pink})
call s:h("shDblBrace",          {"fg": s:Pink})
call s:h("shSubSh",             {})
call s:h("shSubRegion",         {})
" }}}

" BASH: {{{
hi link bashBuiltinCommands Function
" }}}

" ZSH: {{{
call s:h("zshFunction",    {"fg": s:Yellow})
call s:h("zshParentheses", {"fg": s:cdFront})
call s:h("zshVariableDef", {"fg": s:LightBlue})
call s:h("zshParentheses", {"fg": s:cdFront})
" }}}

" Todo:
" (todo.txt) {{{
call s:h("todoItem",        {"fg": s:cdFront})
call s:h("todoID",          {"fg": s:DarkGray})
call s:h("todoDone",        {"fg": s:Gray})
call s:h("todoDate",        {"fg": s:Gray})
call s:h("todoOverDueDate", {"fg": s:LightRed})
call s:h("todoProject",     {"fg": s:Cyan})
call s:h("todoContext",     {"fg": s:LightBlue})
call s:h("todoExtra",       {"fg": s:LightGreen})
call s:h("todoString",      {"fg": s:Cyan})
call s:h("todoPriorityA",   {"fg": s:Red})
call s:h("todoPriorityB",   {"fg": s:LightRed})
call s:h("todoPriorityC",   {"fg": s:Orange})
call s:h("todoPriorityD",   {"fg": s:YellowOrange})
call s:h("todoPriorityE",   {"fg": s:Yellow})
call s:h("todoPriorityF",   {"fg": s:LightGreen})
call s:h("todoComment",     {"fg": s:DarkGray,     "gui": "italic"})
" }}}

" TSV:
" (chrisbra/csv.vim) {{{
hi link CSVComment Comment
call s:h("CSVColumnEven",       {"fg": s:Blue})
call s:h("CSVColumnOdd",        {"fg": s:Green})
call s:h("CSVColumnHeaderEven", {"fg": s:cdBack, "bg": s:Blue})
call s:h("CSVColumnHeaderOdd",  {"fg": s:cdBack, "bg": s:Green})
" }}}

" VimL: {{{
hi link vimCtrlChar YellowOrange
call s:h("vimEcho",           {"fg": s:Yellow})
call s:h("vimNamespace",      {"fg": s:Cyan})
call s:h("vimCVar",           {"fg": s:Cyan})
call s:h("vimVarNamespace",   {"fg": s:Cyan})
call s:h("vimVar",            {"fg": s:LightBlue})
call s:h("vimEnvVar",         {"fg": s:LightBlue,   "gui": "italic"})
call s:h("vimBuiltin",        {"fg": s:Blue}) " FIXME: find a better additional context color for ≈ global scope
call s:h("vimUserFunc",       {"fg": s:Yellow})
call s:h("vimUsrCmd",         {"fg": s:Yellow})
call s:h("vimDocBlock",       {"fg": s:Green})
" call s:h("vimUserCmd",        {"fg": s:Yellow})
" call s:h("vimUserAttrb",      {"fg": s:Yellow})
" call s:h("vimUserAttrbKey",   {"fg": s:Yellow})
call s:h("vimFunction",       {"fg": s:Yellow})
call s:h("vimFunctionError",  {"fg": s:Red})
call s:h("vimContinue",       {"fg": s:DarkGray})
call s:h("vimLineComment",    {"fg": s:DarkGray,     "gui": "italic"})
call s:h("vimCommentTitle",   {"fg": s:Green,        "gui": "italic"})
call s:h("vimBracket",        {"fg": s:Gray})
call s:h("vimNotFunc",        {"fg": s:Pink})
call s:h("vimCommand",        {"fg": s:Pink})
call s:h("vimCmdSep",         {"fg": s:Pink})
call s:h("vimOperParen",      {"fg": s:LightBlue})
call s:h("vimParenSep",       {"fg": s:cdFront})
call s:h("vimSetSep",         {"fg": s:cdFront})
call s:h("vimOper",           {"fg": s:Violet})
call s:h("vimSep",            {"fg": s:cdFront})
call s:h("vimOption",         {"fg": s:LightBlue})
call s:h("vimSet",            {"fg": s:LightBlue})
call s:h("vimLet",            {"fg": s:Blue})
call s:h("vimMap",            {"fg": s:Pink})
call s:h("vimNotation",       {"fg": s:YellowOrange})
call s:h("vimMapMod",         {"fg": s:Gray})
call s:h("vimMapModKey",      {"fg": s:Blue})
call s:h("vimMapLhs",         {"fg": s:LightBlue})
call s:h("vimMapRhs",         {"fg": s:Cyan})
call s:h("vimIsCommand",      {"fg": s:LightBlue})
call s:h("vimFtOption",       {"fg": s:Cyan})
call s:h("vimFtCmd",          {"fg": s:Pink})
call s:h("vimHighlight",      {"fg": s:Blue})
call s:h("vimHiAttrib",       {"fg": s:LightBlue})
call s:h("vimHiLink",         {"fg": s:YellowOrange})
call s:h("vimHLGroup",        {"fg": s:YellowOrange})
call s:h("vimEchoHL",         {"fg": s:Cyan})
call s:h("vimAutoCmd",        {})
call s:h("vimAutoEvent",      {})
call s:h("vimAutoCmdSfxList", {})
" " Vim Syntax RegEx:
call s:h("vimSynRegPat",      {"fg": s:LightRed})
call s:h("vimPatSep",         {"fg": s:Pink})
call s:h("vimPatSepR",        {"fg": s:YellowOrange,})
call s:h("vimSynPatRange",    {"fg": s:LightBlue})
call s:h("vimSynPatMod",      {"fg": s:LightBlue})
call s:h("vimSynNotPatRange", {"fg": s:Blue})
call s:h("vimSynMatchRegion", {"fg": s:LightRed})
" call s:h("vimSynPatRegion",   {})
" call s:h("vimPatRegion",      {"fg": s:Yellow})
" call s:h("vimCollection",     {"fg": s:Blue})
" " Vim Syntax Groups:
call s:h("vimGroupList",      {"fg": s:LightBlue})
call s:h("vimGroup",          {"fg": s:YellowOrange,})
call s:h("vimHiGroup",        {"fg": s:Cyan})
call s:h("vimGroupName",      {"fg": s:LightBlue})
call s:h("vimGroupAdd",       {"fg": s:Pink})
" call s:h("vimClusterName",                      {}, {}, "none",   {})
call s:h("vimSynNextGroup",   {"fg": s:Pink})
" " Vim Syntax:
call s:h("vimSyn",            {})
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
" " call s:h("vimSynCase",        {},               {}, "none",   {})
" call s:h("vimSynRegion",     {},        {}, "none",   {})
" call s:h("vimSynKeyRegion",  {},         {}, "none",   {})
call s:h("nvimMap",           {"fg": s:Violet})
call s:h("nvimMapBang",       {"fg": s:Violet})
call s:h("nvimUnmap",         {"fg": s:Violet})
call s:h("nvimHLGroup",       {"fg": s:Violet})
" call s:h("termcursor",      {"fg": s:Violet, "bg": s:Green,})
" call s:h("termcursornc",    {"fg": s:Violet, "bg": s:BrightBlue,})
" call s:h("quickfixline",    {"fg": s:Violet, "bg": s:Violet})
" }}}

" YAML: {{{
hi link yamlPlainScalar String
call s:h("yamlBlockMappingKey",     {"fg": s:LightBlue})
call s:h("yamlFlowString",          {"fg": s:Orange})
call s:h("yamlFlowStringDelimiter", {"fg": s:Orange})
call s:h("yamlEscape",              {"fg": s:YellowOrange,})
call s:h("yamlDocumentStart",       {"fg": s:Pink})
call s:h("yamlDocumentEnd",         {"fg": s:Pink})
call s:h("yamlKeyValueDelimiter",   {"fg": s:Pink})
" }}}

" ==============================================================================
"  === Plugin Filetypes ===
" ==============================================================================

" (SirVer/ultisnips) {{{
call s:h("snipSnippet",              {})
call s:h("snipSnippetBody",          {"fg": s:cdFront})
call s:h("snipSnippetDocString",     {"fg": s:Orange})
call s:h("snipSnippetTrigger",       {"fg": s:Yellow})
call s:h("snipEscape",               {"fg": s:YellowOrange})
call s:h("snipSnippetHeader",        {"fg": s:DarkGray})
call s:h("snipSnippetFooter",        {"fg": s:DarkGray})
call s:h("snipSnippetFooterKeyword", {"fg": s:Gray})
call s:h("snipSnippetHeaderKeyword", {"fg": s:Gray})
call s:h("snipTabStop",              {"fg": s:Blue})
call s:h("snipTabStopDefault",       {"fg": s:LightBlue})
call s:h("snipVisual",               {"fg": s:Selection})
call s:h("snipCommand",              {"fg": s:Cyan})
call s:h("snipVimlCommand",          {"fg": s:Cyan})
call s:h("snipVimlCommandV",         {"fg": s:Cyan})
call s:h("snipPythonCommand",        {"fg": s:Cyan})
call s:h("snipPythonCommandP",       {"fg": s:Cyan})
call s:h("snipSnippetOptions",       {})
call s:h("snipGlobal",               {"fg": s:Pink})
call s:h("snipGlobalPHeader",        {"fg": s:Cyan})
call s:h("snipGlobalHeaderKeyword",  {"fg": s:Pink})
call s:h("snipSnippetOptionFlag",    {"fg": s:Pink})
call s:h("snipLeadingSpaces",        {"fg": s:cdNop})
call s:h("snipLeadingSpaces",        {"fg": s:cdNop})
" }}}

" (Shougo/neosnippet) {{{
" call s:h("neosnippetName",             {"fg": s:Cyan})
" call s:h("neosnippetAbbr",             {"fg": s:Orange})
" call s:h("neosnippetOption",           {"fg": s:Blue})
" call s:h("neosnippetWord",             {"fg": s:cdFront})
" call s:h("neosnippetPlaceHolder",      {"fg": s:LightBlue})
" call s:h("neosnippetKeyword",          {"fg": s:Pink})
" call s:h("neosnippetStatementAbbr",    {"fg": s:Pink})
" call s:h("neosnippetStatementName",    {"fg": s:Pink})
" call s:h("neosnippetStatementOptions", {"fg": s:Pink})
" }}}

" Tmux: {{{
hi link tmuxComment Comment
hi link tmuxString String
hi link tmuxStringDelimiter String
call s:h("tmuxOptions",             {"fg": s:Pink})
call s:h("tmuxFmtConditional",      {"fg": s:Pink})
call s:h("tmuxOptsSet",             {"fg": s:YellowOrange})
call s:h("tmuxOptsSetw",            {"fg": s:YellowOrange})
call s:h("tmuxWindowPaneCmds",      {"fg": s:Yellow})
call s:h("tmuxAttrEquals",          {"fg": s:cdFront})
call s:h("tmuxShellInpol",          {"fg": s:cdFront})
call s:h("tmuxAttrSeparator",       {"fg": s:Gray})
call s:h("tmuxFmtInpol",            {"fg": s:Gray})
call s:h("tmuxSpecialCmds",         {"fg": s:Blue})
call s:h("tmuxFmtInpolDelimiter",   {"fg": s:Blue})
call s:h("tmuxAttrInpolDelimiter",  {"fg": s:Blue})
call s:h("tmuxShellInpolDelimiter", {"fg": s:Blue})
call s:h("tmuxURL",                 {"fg": s:LightBlue})
call s:h("tmuxColor",               {"fg": s:LightBlue})
call s:h("tmuxStyle",               {"fg": s:LightBlue})
call s:h("tmuxVariable",            {"fg": s:LightBlue})
call s:h("tmuxAttrBgFg",            {"fg": s:LightBlue})
call s:h("tmuxFmtVariable",         {"fg": s:LightBlue})
call s:h("tmuxKey",                 {"fg": s:Cyan})
call s:h("tmuxFmtAlias",            {"fg": s:Cyan})
call s:h("tmuxDateInpol",           {"fg": s:Cyan})
call s:h("tmuxKeySymbol",           {"fg": s:Cyan})
call s:h("tmuxOptionValue",         {"fg": s:Cyan})
" }}}

" Vimwiki: {{{
" call s:h("VimwikiHeaderChar", {"fg": s:Pink})
" call s:h("VimwikiHeader1",    {"fg": s:Blue})
" call s:h("VimwikiHeader2",    {"fg": s:Blue})
" call s:h("VimwikiHeader3",    {"fg": s:Blue})
" call s:h("VimwikiHeader4",    {"fg": s:Blue})
" call s:h("VimwikiHeader5",    {"fg": s:Blue})
" call s:h("VimwikiHeader6",    {"fg": s:Blue})
" call s:h("VimwikiListTodo",   {"fg": s:cdFront,  "bg": s:Green})
" call s:h("VimwikiH1Folding",  {"fg": s:cdFront})
" }}}

" (lervag/wiki) {{{
" call s:h("wikiHeader1",         "fg": s:Blue})
" call s:h("wikiHeader2",         "fg": s:Blue})
" call s:h("wikiHeader3",         "fg": s:Blue})
" call s:h("wikiHeader4",         "fg": s:Blue})
" call s:h("wikiList",            "fg": s:BrightBlue})
" call s:h("wikiLine",            "fg": s:BrightBlue})
" call s:h("wikiLinkWiki",        "fg": s:LightBlue})
" call s:h("wikiLinkWikiConceal", {})
" }}}

" (jceb/vim-orgmode) {{{
" call s:h("hyperlink",             {"fg": s:LightBlue})
" call s:h("org_title",             {"fg": s:Cyan})
" call s:h("org_heading1",          {"fg": s:Pink})
" call s:h("org_heading2",          {"fg": s:BrightBlue})
" call s:h("org_heading3",          {"fg": s:Green})
" call s:h("org_heading4",          {"fg": s:YellowOrange})
" call s:h("org_heading5",          {"fg": s:LightRed})
" call s:h("org_shade_stars",       {"fg": s:VeryDarkGray})
" call s:h("org_list_item",         {"fg": s:BrightBlue})
" call s:h("org_list_unordered",    {"fg": s:BrightBlue})
" call s:h("org_list_ckeckbox",     {"fg": s:BrightBlue})
" call s:h("org_todo_keyword_done", {"fg": s:BrightBlue})
" }}}

" ==============================================================================
"  === Plugins ===
" ==============================================================================

" (w0rp/ale) {{{
call s:h("ALEInfo",             {})
call s:h("ALEError",            {})
call s:h("ALEWarning",          {})
call s:h("ALEStyleError",       {})
call s:h("ALEStyleWarning",     {})
call s:h("ALEInfoSign",         {"fg": s:LightGreen,   "bg": s:VeryDarkGray})
call s:h("ALEErrorSign",        {"fg": s:LightRed,     "bg": s:VeryDarkGray})
call s:h("ALEWarningSign",      {"fg": s:YellowOrange, "bg": s:VeryDarkGray})
call s:h("ALEStyleErrorSign",   {"fg": s:Yellow,       "bg": s:VeryDarkGray})
call s:h("ALEStyleWarningSign", {"fg": s:Yellow,       "bg": s:VeryDarkGray})
call s:h("ALEInfoLine",         {})
call s:h("ALEErrorLine",        {})
call s:h("ALEWarningLine",      {})
" }}}

" neomake/neomake {{{
hi link NeomakeErrorSign    ALEErrorSign
hi link NeomakeWarningSign  ALEWarningSign
hi link NeomakeMessagesSign ALEInfoSign
hi link NeomakeInfoSign     ALEInfoSign
" }}}

" (MattesGroeger/vim-bookmarks) {{{
" call s:h("BookmarkSign",           {"fg": s:Cyan, "bg": s:VeryDarkGray})
" call s:h("BookmarkAnnotationSign", {"fg": s:Cyan, "bg": s:VeryDarkGray})
" call s:h("BookmarkLine",           {})
" call s:h("BookmarkAnnotationLine", {})
" }}}

" (ap/vim-buftabline) {{{
call s:h("BufTabLineCurrent", {"fg": s:cdBack,  "bg": s:Green})
call s:h("BufTabLineActive",  {"fg": s:Green, "bg": s:VeryDarkGray})
call s:h("BufTabLineHidden",  {"fg": s:cdFront, "bg": s:VeryDarkGray})
call s:h("BufTabLineFill",    {"bg": s:VeryDarkGray})
" }}}

" Cheat40: {{{
" call s:h("Cheat40Descr",        {})
" call s:h("Cheat40Command",      {"fg": s:LightBlue})
" call s:h("Cheat40Header",       {"fg": s:BrightBlue})
" call s:h("Cheat40Divider",      {"fg": s:BrightBlue})
" call s:h("Cheat40About",        {})
" call s:h("Cheat40FirstLine",    {"fg": s:Pink})
" call s:h("Cheat40BeginSection", {})
" call s:h("Cheat40EndSection",   {})
" call s:h("Cheat40Tag",          {"fg": s:Green})
" call s:h("Cheat40Backtick",     {"fg": s:Green})
" call s:h("Cheat40Mode",         {"fg": s:Cyan})
" call s:h("Cheat40Angle",        {"fg": s:Green})
" call s:h("Cheat40DblAngle",     {"fg": s:YellowOrange})
" call s:h("Cheat40Comment",      {"fg": s:BrightBlue,   "gui": "italic"})
" call s:h("Cheat40Hash",         {"fg": s:cdFront,        "gui": "none"})
" call s:h("Cheat40Runtime",      {})
" }}}

" (Shougo/denite.nvim) {{{
" call s:h("deniteMatchedChar",   {"fg": s:Cyan, "gui": "underline"})
" call s:h("deniteMatchedRange", {})
" call s:h("deniteStatusLine", {})
" call s:h("deniteSourceLine_",{})
" call s:h("denitePrompt",        {"fg": s:Cyan})
" call s:h("deniteConcealedMark", {"fg": s:DarkBlue})
call s:h("deniteModeNormal",    {})
call s:h("deniteModeInsert",    {})
call s:h("deniteSource_Projectile_Name",    {"fg": s:Cyan})
" }}}

" (airblade/vim-gitgutter) {{{
call s:h("GitGutterAdd",              {"fg": s:Green,        "bg": s:VeryDarkGray})
call s:h("GitGutterChange",           {"fg": s:YellowOrange, "bg": s:VeryDarkGray})
call s:h("GitGutterDelete",           {"fg": s:LightRed,     "bg": s:VeryDarkGray})
call s:h("GitGutterChangeDelete",     {"fg": s:YellowOrange, "bg": s:VeryDarkGray})
call s:h("GitGutterAddLine",          {})
call s:h("GitGutterChangeLine",       {})
call s:h("GitGutterDeleteLine",       {})
call s:h("GitGutterChangeDeleteLine", {})
" }}}

" (junegunn/vim-github-dashboard) {{{
call s:h("githubNumber",  {"fg": s:LightGreen})
call s:h("githubTime",    {"fg": s:Gray})
call s:h("githubUser",    {"fg": s:Blue})
call s:h("githubBranch",  {"fg": s:Pink})
call s:h("githubRepo",    {"fg": s:Orange})
call s:h("githubSHA",     {"fg": s:LightGreen})
call s:h("githubKeyword", {"fg": s:Cyan})
call s:h("githubCommit",  {"fg": s:Cyan})
call s:h("githubRelease", {"fg": s:Cyan})
call s:h("githubTag",     {"fg": s:Cyan})
call s:h("githubEdit",    {"fg": s:Cyan})
call s:h("githubGist",    {"fg": s:Cyan})
" }}}

" (hecal3/vim-leader-guide) {{{
" call s:h("LeaderGuideKeys",     {"fg": s:Cyan})
" call s:h("LeaderGuideBrackets", {"fg": s:DarkGray})
" call s:h("LeaderGuideDesc",     {"fg": s:Blue})
" }}}

" (justinmk/vim-sneak) {{{
" call s:h("Sneak",      {"fg": s:cdNop, "bg": s:DarkGray})
" call s:h("SneakScope", {"fg": s:cdNop, "bg": s:DarkGray})
" call s:h("SneakLabel", {"fg": s:cdNop, "bg": s:Cyan})
" }}}

" (mhinz/vim-startify) {{{
call s:h("StartifyFile",    {"fg": s:Cyan})
call s:h("StartifyBracket", {"fg": s:cdBack})
call s:h("StartifyNumber",  {"fg": s:LightGreen,})
call s:h("StartifyVar",     {"fg": s:LightGreen,})
call s:h("StartifySpecial", {"fg": s:LightGreen,})
call s:h("StartifySlash",   {"fg": s:DarkGray})
call s:h("StartifyPath",    {"fg": s:DarkGray})
call s:h("StartifySelect",  {})
call s:h("StartifyHeader",  {})
call s:h("StartifySection", {"fg": s:Pink})
" }}}

" (pelodelfuego/vim-swoop) {{{
call s:h("SwoopBufferLineHi",{})
call s:h("SwoopPatternHi", {})
" }}}

" (majutsushi/tagbar) {{{
call s:h("TagbarHelp",       {"fg": s:DarkGray})
call s:h("TagbarHelpKey",    {"fg": s:Gray})
call s:h("TagbarHelpTitle",  {"fg": s:Violet})
call s:h("TagbarKind",       {"fg": s:Cyan})
call s:h("TagbarNestedKind", {"fg": s:LightGreen})
call s:h("TagbarScope",      {"fg": s:Yellow})
call s:h("TagbarType",       {"fg": s:Cyan})
" call s:h("TagbarParens",     {"fg": s:Cyan})
hi link TagbarParens Normal
call s:h("TagbarSignature",  {"fg": s:LightBlue})
call s:h("TagbarPseudoID",   {"fg": s:Pink})
" call s:h("TagbarFoldIcon",   {"fg": s:cdFront})
call s:h("TagbarFunc",       {"fg": s:Yellow})
call s:h("TagbarSection",    {"fg": s:Pink, "gui": "bold"})
" call s:h("TagbarHighlight" {})
" }}}

" (Shougo/unite.vim) {{{
call s:h("uniteStatusNormal",             {"fg": s:Green})
call s:h("uniteStatusInsert",             {"fg": s:Blue})
" call s:h("uniteStatusSourceNames",      {"fg": s:Cyan})
" call s:h("uniteStatusMessage",          {"fg": s:Green})
" call s:h("uniteStatusSourceCandidates", {"fg": s:Yellow})
" call s:h("uniteStatusHead",             {"fg": s:YellowOrange})
call s:h("unitePrompt",                   {"fg": s:Cyan})
" call s:h("uniteStatusLineNR",           {"fg": s:DarkGray})
" }}}

" (romgrk/vimfiler-prompt) {{{
call s:h("FilerCursor",           {"fg": s:DarkGray})
call s:h("FilerSelected",         {"fg": s:DarkGray})
call s:h("FilerActive",           {"fg": s:DarkGray})
call s:h("FilerMatch",            {})
call s:h("FilerNoMatch",          {})
call s:h("FilerPrompt",           {"fg": s:Cyan})
call s:h("FilerInput",            {"fg": s:DarkGray})
call s:h("FilerCompletion",       {"fg": s:DarkGray})
" " (Shougo/vimfiler)
call s:h("vimfilerStatus",           {})
call s:h("vimfilerColumn__devicons", {"fg": s:Gray})
call s:h("vimfilerDirectory",        {"fg": s:Blue})
call s:h("vimfilerCurrentDirectory", {"fg": s:Cyan,     "gui":  "italic"})
call s:h("vimfilerMask",             {"fg": s:Blue})
call s:h("vimfilerMark",             {"fg": s:Green})
call s:h("vimfilerNonMark",          {"fg": s:cdFront})
call s:h("vimfilerLeaf",             {"fg": s:Blue})
call s:h("vimfilerNormalFile",       {"fg": s:cdFront})
call s:h("vimfilerOpenedFile",       {"fg": s:LightBlue})
call s:h("vimfilerClosedFile",       {"fg": s:Blue})
call s:h("vimfilerMarkedFile",       {"fg": s:Green})
call s:h("vimfilerROFile",           {"fg": s:Gray})
" }}}
