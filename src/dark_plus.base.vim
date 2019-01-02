" ==============================================================================
" FILE: Dark Plus Vim
" Author: Clay Dunston <dunstontc@gmail.com>
" License: MIT License
" Last Modified: 2019-01-02
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
let g:terminal_color_0  = s:Black.gui         " black
let g:terminal_color_1  = s:Red.gui           " red
let g:terminal_color_2  = s:Green.gui         " green
let g:terminal_color_3  = s:YellowOrange.gui  " yellow
let g:terminal_color_4  = s:Blue.gui          " blue
let g:terminal_color_5  = s:Magenta.gui       " magenta
let g:terminal_color_6  = s:Cyan.gui          " cyan
let g:terminal_color_7  = s:White.gui         " white
let g:terminal_color_8  = s:Black.gui         " bright_black
let g:terminal_color_9  = s:Red.gui           " bright_red
let g:terminal_color_10 = s:Green.gui         " bright_green
let g:terminal_color_11 = s:YellowOrange.gui  " bright_yellow
let g:terminal_color_12 = s:Blue.gui          " bright_blue
let g:terminal_color_13 = s:Magenta.gui       " bright_magenta
let g:terminal_color_14 = s:Cyan.gui          " bright_cyan
let g:terminal_color_15 = s:White.gui         " bright_white
let g:terminal_color_background = g:terminal_color_0
let g:terminal_color_foreground = g:terminal_color_7
" }}}

