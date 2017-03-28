class Kudomon
  attr_reader :species, :name, :type, :position, :combat_points, :master_ids
  attr_accessor :health_points
  KUDOMON = {
    sourbulb: {
      name: 'Sourbulb', type: :grass, health_points: 30, combat_points: 4
    },
    mancharred: {
      name: 'Mancharred', type: :fire, health_points: 20, combat_points: 7
    },
    wartle: {
      name: 'Wartle', type: :water, health_points: 25, combat_points: 5
    },
    chikapu: {
      name: 'Chikapu', type: :electric, health_points: 15, combat_points: 11
    },
    earthbro: {
      name: 'Earthbro', type: :rock, health_points: 45, combat_points: 2
    },
    kedavra: {
      name: 'Kedavra', type: :psychic, health_points: 18, combat_points: 8
    },
  }

  def initialize(species, position:)
    fail 'This kudomon does not exist' unless valid?(species)

    @species = species
    @position = position
    initialize_stats
    @master_ids = []
  end

  def add_new_owner(trainer)
    master_ids << trainer.object_id
  end

  def caught_by?(trainer)
    master_ids.include?(trainer.object_id)
  end

  def attack!(kudomon)
  end

  def receive_damage(damage_amount)
    self.health_points -= damage_amount
  end

  def knocked_out?
    false
  end

  private

  def valid?(species)
    available_kudomon.include?(species)
  end

  def available_kudomon
    KUDOMON.keys
  end

  def initialize_stats
    @name = stats[:name]
    @type = stats[:type]
    @health_points = stats[:health_points]
    @combat_points = stats[:combat_points]
  end

  def stats
    KUDOMON[species]
  end
end
