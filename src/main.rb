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

# TODO: guisp?
class HighlightGroup
  attr_accessor :group, :fg, :bg, :styling

  def initialize(json_object)
    @group = json_object['group']

    @fg = json_object['style']['fg']
    @bg = json_object['style']['bg']

    @styling = json_object['style']['styling']
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
      @style_cmd = " cterm=NONE gui=NONE"
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

def colors_from_hash_array(hash_array)
  color_hash = {}
  hash_array.each do |color|
    color_hash.store(color['name'], color)
  end
  return color_hash
end

groups_file = File.read('groups.json5')
colors_file = File.read('colors.json')

groups_data = JSON5.parse(groups_file)
colors_data = colors_from_hash_array(JSON.parse(colors_file))

groups_data.each do |data|
  highlight = HighlightGroup.new(data)
  puts HighlightCommand.new(highlight, colors_data).command
end
