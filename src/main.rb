require 'date'
require 'json'
require 'json5'

require './Color'
require './HighlightGroup'
require './Header'

groups_file = File.read('json/groups.json5')
colors_file = File.read('json/colors.json')

groups_data = JSON5.parse(groups_file)
colors_data = colors_from_hash_array(JSON.parse(colors_file))

output = header_text()

groups_data.each do |data|
  if data.key?('link')
    output += link_command(data)
  else
    highlight = HighlightGroup.new(data)
    output += HighlightCommand.new(highlight, colors_data).command
  end
end

File.write('../colors/dark_plus.vim', output)
