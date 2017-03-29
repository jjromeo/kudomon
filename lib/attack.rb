class Attack
  attr_reader :attacker, :defender
  SUPER_EFFECTIVE = {
    water: :fire,
    fire: :grass,
    grass: :rock,
    rock: :electric,
    electric: :water,
  }

  WEAKNESS_MULTIPLIER = 1.5

  def initialize(attacker, defender)
    @attacker = attacker
    @defender = defender
  end

  def deal_damage!
    attack_value = add_bonus_damage(attacker.combat_points)
    defender.receive_damage!(attack_value)
  end

  private

  def add_bonus_damage(damage_amount)
    super_effective? ? (damage_amount * WEAKNESS_MULTIPLIER).ceil : damage_amount
  end

  def super_effective?
    if attacker.type == :psychic && defender.type != :psychic
      true
    else
      SUPER_EFFECTIVE[attacker.type] == defender.type
    end
  end
end
