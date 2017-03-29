class Battle
  attr_reader :kudomon1, :kudomon2, :both_kudomon, :winner
  attr_accessor :ended
  def initialize(kudomon1, kudomon2)
    fail 'a kudomon cannot fight itself' if kudomon1 == kudomon2

    @kudomon1 = kudomon1
    @kudomon2 = kudomon2
    @both_kudomon = [kudomon1, kudomon2]
    @ended = false
  end

  def first_attacker
    @first_attacker ||= [kudomon1, kudomon2].sample
  end

  def second_attacker
    (both_kudomon - [first_attacker]).first
  end

  def start_battle
    turn until ended == true
    winner
  end

  def turn
    if both_kudomon.any?(&:knocked_out?)
      winning_kudomon = both_kudomon.reject(&:knocked_out?).first
      end_battle(winner: winning_kudomon)
    else
      fight
    end
  end

  def fight
    first_attacker.attack(second_attacker)
    second_attacker.attack(first_attacker)
  end

  def end_battle(winner:)
    @ended = true
    @winner = winner
    puts "#{winner} has won the battle!"
  end
end
