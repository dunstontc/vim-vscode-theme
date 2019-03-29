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
  template = '''
  " ==============================================================================
  " FILE: Dark Plus Vim
  " Author: Clay Dunston <dunstontc@gmail.com>
  " License: MIT License
  " Last Modified: 2019-03-29
  " ==============================================================================
'''

end

groups_file = File.read('json/groups.json5')
colors_file = File.read('json/colors.json')

groups_data = JSON5.parse(groups_file)
colors_data = colors_from_hash_array(JSON.parse(colors_file))

groups_data.each do |data|
  if data.key?('link')
    puts link_command(data)
  else
    highlight = HighlightGroup.new(data)
    puts HighlightCommand.new(highlight, colors_data).command
  end
end
