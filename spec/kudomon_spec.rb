require 'spec_helper'
require 'byebug'
RSpec.describe Kudomon do
  context 'initializing with a species' do
    let(:position) { double :position }

    context 'with a species which exists' do
      subject(:sourbulb) { Kudomon.new(:sourbulb, position: position)}

      its(:name) { is_expected.to eq 'Sourbulb'}
      its(:type) { is_expected.to eq :grass}
      its(:position) { is_expected.to eq position }
    end

    context 'with a species which does not exist' do
      it 'will cause an error' do
        expect { Kudomon.new(:fakemon, position: position) }.to raise_error "This kudomon does not exist"
      end
    end
  end
end
