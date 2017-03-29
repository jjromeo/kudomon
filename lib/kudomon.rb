class Kudomon
  attr_reader :species, :name, :type, :position, :combat_points, :master_ids, :attack_class
  attr_accessor :health_points, :knocked_out
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

  def initialize(species, position:, attack_class: Attack)
    fail 'This kudomon does not exist' unless valid?(species)

    @attack_class = attack_class
    @species = species
    @position = position
    @knocked_out = false
    initialize_stats
    @master_ids = []
  end

  def to_s
    name
  end

  def add_new_owner(trainer)
    master_ids << trainer.object_id
  end

  def caught_by?(trainer)
    master_ids.include?(trainer.object_id)
  end

  def attack(kudomon)
    attack_class.new(self, kudomon).deal_damage unless knocked_out?
  end

  def receive_damage(damage_amount)
    self.health_points -= damage_amount
    if health_points <= 0
      @knocked_out = true
      puts "#{name} was knocked out!"
    end
  end

  def knocked_out?
    @knocked_out
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
