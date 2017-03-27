class Trainer
  attr_reader :position, :kudomon

  def initialize(position:)
    @position = position
    @kudomon = []
  end

  def capture(a_kudomon)
    kudomon << a_kudomon if position.nearby?(a_kudomon.position)
  end
end
