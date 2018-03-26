" Color palette

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
let s:Blue =         { 'gui': '#569cd6', 'cterm16': '04', 'cterm': '75'  }
let s:LightBlue =    { 'gui': '#9cdcfe', 'cterm16': '06', 'cterm': '117' }
let s:DarkBlue =     { 'gui': '#264f78', 'cterm16': '04', 'cterm': '24'  }
let s:Cyan =         { 'gui': '#4ec9b0', 'cterm16': '06', 'cterm': '43'  }
let s:Magenta =      { 'gui': '#c586c0', 'cterm16': '13', 'cterm': '176' }

let s:guiBG = "#303030"
let s:guiFG = "#d4d4d4"


let s:ctermBG = "234"
let s:ctermFG = "188"

let s:guiWhite = "#ffffff"
let s:guiGray = "#585858"
let s:ctermWhite = "231"
let s:ctermGray = "240"

let g:airline#themes#dark_plus#palette = {}
let s:modified = { 'airline_c': [ s:guiGray, '', s:ctermGray, '', '' ] }

" Normal mode
let s:N1 = [ s:guiBG , s:Green.gui , s:ctermBG , s:Green.cterm  ]
let s:N2 = [ s:guiBG , s:Green.gui , s:ctermBG , s:Green.cterm ]
let s:N3 = [ s:guiFG , s:guiBG , s:ctermFG , s:ctermBG  ]
let g:airline#themes#dark_plus#palette.normal=airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#dark_plus#palette.normal_modified=s:modified

" Insert mode
let s:I1 = [ s:guiBG , s:LightBlue.gui , s:ctermBG , s:LightBlue.cterm  ]
let s:I2 = [ s:guiBG , s:LightBlue.gui , s:ctermBG , s:LightBlue.cterm  ]
let s:I3 = s:N3
let g:airline#themes#dark_plus#palette.insert=airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#dark_plus#palette.insert_modified=s:modified

" Visual mode
let s:V1 = [ s:guiBG , s:Magenta.gui , s:ctermBG , s:Magenta.cterm ]
let s:V2 = s:N2
let s:V3 = s:N3
let g:airline#themes#dark_plus#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#dark_plus#palette.visual_modified = s:modified

" Replace mode
let s:R1 = [ s:guiBG , s:Orange.gui , s:ctermBG, s:Orange.cterm ]
let s:R2 = s:N2
let s:R3 = s:N3
let g:airline#themes#dark_plus#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#dark_plus#palette.replace_modified = s:modified

" Inactive mode
let s:IN1 = [ s:guiBG , s:guiFG , s:ctermBG , s:ctermFG ]
let s:IN2 = [ s:guiFG , s:guiBG , s:ctermFG , s:ctermBG ]
let s:IN3 = s:IN2
let g:airline#themes#dark_plus#palette.inactive = airline#themes#generate_color_map(s:IN1, s:IN2, s:IN3)
let g:airline#themes#dark_plus#palette.inactive_modified = s:modified

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 = s:N1
let s:CP2 = s:N2
let s:CP3 = s:N3

let g:airline#themes#dark_plus#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)
