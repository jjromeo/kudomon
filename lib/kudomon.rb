class Kudomon
  attr_reader :species, :name, :type, :position, :master_ids
  KUDOMON = {
    sourbulb: {name: 'Sourbulb', type: :grass},
    mancharred: {name: 'Mancharred', type: :fire},
    wartle: {name: 'Wartle', type: :water},
    chikapu: {name: 'Chikapu', type: :electric},
    earthbro: {name: 'Earthbro', type: :rock},
    kedavra: {name: 'Kedavra', type: :psychic},
  }

  def initialize(species, position:)
    fail 'This kudomon does not exist' unless valid?(species)

    @species = species
    @position = position
    @name = stats[:name]
    @type = stats[:type]
    @master_ids = []
  end

  def stats
    KUDOMON[species]
  end

  def valid?(species)
    available_kudomon.include?(species)
  end

  def available_kudomon
    KUDOMON.keys
  end

  def add_new_owner(trainer)
    master_ids << trainer.object_id
  end

  def caught_by?(trainer)
    master_ids.include?(trainer.object_id)
  end
end
