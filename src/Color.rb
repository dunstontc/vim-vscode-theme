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
