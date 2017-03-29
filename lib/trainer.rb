class Trainer
  attr_reader :position, :kudomon

  def initialize(position:)
    @position = position
    @kudomon = []
  end

  def capture(a_kudomon)
    if position.nearby?(a_kudomon.position) && !a_kudomon.caught_by?(self)
      a_kudomon.add_new_owner(self)
      kudomon << a_kudomon.clone
    end
  end
end
