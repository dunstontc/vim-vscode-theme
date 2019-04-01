require 'date'
require 'json'
require 'json5'

class Color
  attr_reader :name, :gui, :cterm, :cterm16
  def initialize(json_object)
    self.name    = json_object['name']
    self.gui     = json_object['gui']
    self.cterm   = json_object['cterm']
    self.cterm16 = json_object['cterm16']
  end
end

def colors_from_hash_array(hash_array)
  color_hash = {}
  hash_array.each do |color|
    color_hash.store(color['name'], color)
  end
  return color_hash
end

class HighlightGroup
  attr_accessor :group, :link, :fg, :bg, :styling
  def initialize(json_object)
    @group   = json_object['group']
    @link    = json_object['link']             || nil
    @fg      = json_object['style']['fg']      || nil
    @bg      = json_object['style']['bg']      || nil
    @styling = json_object['style']['styling'] || nil
  end
end

class HighlightCommand
  def initialize(hl_group, colors)
    @base_cmd = "highlight #{hl_group.group}"

    if !hl_group.fg.nil?()
      color = colors[hl_group.fg]
      @cterm_fg_cmd = " ctermfg=#{color['cterm16']}"
      @gui_fg_cmd   = " guifg=#{color['gui']}"
    else
      @cterm_fg_cmd = ''
      @gui_fg_cmd   = ''
    end

    if !hl_group.bg.nil?()
      color = colors[hl_group.bg]
      @cterm_bg_cmd = " ctermbg=#{color['cterm16']}"
      @gui_bg_cmd   = " guibg=#{color['gui']}"
    else
      @cterm_bg_cmd = ''
      @gui_bg_cmd   = ''
    end

    if !hl_group.styling.nil?()
      @style_cmd = " cterm=#{hl_group.styling} gui=#{hl_group.styling}"
    else
      @style_cmd = ' cterm=NONE gui=NONE'
    end
  end

  def command
    return @base_cmd +
           @cterm_fg_cmd +
           @gui_fg_cmd +
           @cterm_bg_cmd +
           @gui_bg_cmd +
           @style_cmd
  end
end

def link_command(hl_group)
  return "highlight link #{hl_group['group']} #{hl_group['link']}"
end

def header_text
"""
\" ==============================================================================
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

groups_file = File.read('json/groups.json5')
colors_file = File.read('json/colors.json')

groups_data = JSON5.parse(groups_file)
colors_data = colors_from_hash_array(JSON.parse(colors_file))


puts header_text()

groups_data.each do |data|
  if data.key?('link')
    puts link_command(data)
  else
    highlight = HighlightGroup.new(data)
    puts HighlightCommand.new(highlight, colors_data).command
  end
end
