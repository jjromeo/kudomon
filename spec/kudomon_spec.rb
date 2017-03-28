require 'spec_helper'
require 'byebug'
RSpec.describe Kudomon do
  let(:position) { instance_double Position}
  subject(:sourbulb) { Kudomon.new(:sourbulb, position: position)}

  context 'initializing with a species' do
    context 'with a species which exists' do

      context 'initializes with preset stats' do
        its(:name) { is_expected.to eq 'Sourbulb'}
        its(:type) { is_expected.to eq :grass}
        its(:position) { is_expected.to eq position }
        its(:health_points) { are_expected.to eq 30 }
        its(:combat_points) { are_expected.to eq 4 }
      end

      it 'will not raise an error' do
        valid_kudomon = %i(sourbulb mancharred wartle chikapu earthbro kedavra)
        valid_kudomon.each do |kudomon|
          expect { Kudomon.new(kudomon, position: position) }.not_to raise_error
        end
      end
    end

    context 'with a species which does not exist' do
      it 'will cause an error' do
        expect { Kudomon.new(:fakemon, position: position) }.to raise_error "This kudomon does not exist"
      end
    end
  end

  context 'being caught' do
    it 'knows when it has not been caught by a trainer' do
      trainer = instance_double Trainer
      expect(sourbulb.caught_by?(trainer)).to eq false
    end

    it 'knows when it has been caught by a trainer' do
      trainer = instance_double Trainer
      sourbulb.add_new_owner(trainer)
      expect(sourbulb.caught_by?(trainer)).to eq true
    end

    it 'can be caught by multiple trainers' do
      trainer = instance_double Trainer
      trainer2 = instance_double Trainer

      sourbulb.add_new_owner(trainer)
      sourbulb.add_new_owner(trainer2)
      expect(sourbulb.caught_by?(trainer)).to eq true
      expect(sourbulb.caught_by?(trainer2)).to eq true
    end
  end

  context 'battling' do
    it { is_expected.not_to be_knocked_out }

    it 'can receive damage' do
      expect{ sourbulb.receive_damage!(5) }.
        to change { sourbulb.health_points }.from(30).to(25)
    end

    it 'will be knocked out when its hp is reduced below 0' do
      expect { sourbulb.receive_damage!(30) }.
        to change { sourbulb.knocked_out? }.from(false).to(true)
    end
  end
end
