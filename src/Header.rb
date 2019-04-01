def header_text()
"""\" ==============================================================================
\" FILE: Dark Plus Vim
\" Author: Clay Dunston <dunstontc@gmail.com>
\" License: MIT License
\" Last Modified: #{DateTime.now.strftime('%Y-%m-%d')}
\" ==============================================================================

\" Setup: {{{
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
\" }}}

\" Terminal Colors:  {{{
let g:terminal_color_0  = '#1e1e1e'  \" black
let g:terminal_color_1  = '#f44747'  \" red
let g:terminal_color_2  = '#608b4e'  \" green
let g:terminal_color_3  = '#d7ba7d'  \" yellow
let g:terminal_color_4  = '#569cd6'  \" blue
let g:terminal_color_5  = '#c586c0'  \" magenta
let g:terminal_color_6  = '#4ec9b0'  \" cyan
let g:terminal_color_7  = '#d4d4d4'  \" white
let g:terminal_color_8  = '#1e1e1e'  \" bright_black
let g:terminal_color_9  = '#f44747'  \" bright_red
let g:terminal_color_10 = '#608b4e'  \" bright_green
let g:terminal_color_11 = '#d7ba7d'  \" bright_yellow
let g:terminal_color_12 = '#569cd6'  \" bright_blue
let g:terminal_color_13 = '#c586c0'  \" bright_magenta
let g:terminal_color_14 = '#4ec9b0'  \" bright_cyan
let g:terminal_color_15 = '#d4d4d4'  \" bright_white
let g:terminal_color_background = g:terminal_color_0
let g:terminal_color_foreground = g:terminal_color_7
\" }}}
"""
end
