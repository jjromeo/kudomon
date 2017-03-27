require 'spec_helper'
require 'byebug'
RSpec.describe Kudomon do
  context 'initializing with a species' do

    context 'with a species which exists' do
      let(:position) { double :position, x: 2, y: 3 }
      subject(:sourbulb) { Kudomon.new(:sourbulb, position: position)}

      its(:name) { is_expected.to eq 'Sourbulb'}
      its(:type) { is_expected.to eq :grass}
      its(:position) { is_expected.to eq position }
    end
  end
end
