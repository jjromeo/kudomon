class Kudomon
  attr_reader :species, :name, :type, :position
  KUDOMON = {
    sourbulb: {name: 'Sourbulb', type: :grass},
    mancharred: {name: 'Mancharred', type: :fire},
    wartle: {name: 'Wartle', type: :water},
    chikapu: {name: 'Chikapu', type: :electric},
  }

  def initialize(species, position:)
    @species = species
    @position = position
    @name = stats[:name]
    @type = stats[:type]
  end

  def stats
    KUDOMON[species]
  end
end
