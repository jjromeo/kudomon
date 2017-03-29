require 'spec_helper'
RSpec.describe Position do
  subject(:position) { Position.new(longitude: 1, latitude: 2) }

  its(:longitude) { is_expected.to eq 1 }
  its(:latitude) { is_expected.to eq 2 }

  context '#nearby?' do
    let(:position2) { Position.new(longitude: 1, latitude: 2) }
    it { is_expected.to be_nearby(position2) }

    it 'knows if an object is out of range' do
      close_position = Position.new(longitude: 10, latitude: 15)
      far_position = Position.new(longitude: 30, latitude: 45)

      expect(close_position).not_to be_nearby(far_position)
    end
  end
end
