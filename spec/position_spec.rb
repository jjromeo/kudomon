require 'spec_helper'
RSpec.describe Position do
  it 'initializes with a longitude and latitude' do
    position = Position.new(longitude: 1, latitude: 2)
    expect(position.longitude).to eq 1
    expect(position.latitude).to eq 2
  end

  context '#nearby?' do
    it 'knows if an object is near' do
      position = Position.new(longitude: 1, latitude: 2)
      position2 = Position.new(longitude: 1, latitude: 2)
      expect(position.nearby?(position2)).to eq true
    end

    it 'knows if an object is out of range' do
      position = Position.new(longitude: 10, latitude: 15)
      position2 = Position.new(longitude: 30, latitude: 45)
      expect(position.nearby?(position2)).to eq false
    end
  end
end
