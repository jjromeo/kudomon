class Position
  MAX_RANGE = 4
  attr_reader :longitude, :latitude
  def initialize(longitude:, latitude:)
    @longitude = longitude
    @latitude = latitude
  end

  def nearby?(position)
    longitude_distance = (longitude - position.longitude).abs
    latitude_distance = (latitude - position.latitude).abs
    longitude_distance <= MAX_RANGE && latitude_distance <= MAX_RANGE
  end
end
