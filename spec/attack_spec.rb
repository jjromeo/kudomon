require 'spec_helper'
RSpec.describe Attack do
  let(:attacker) { instance_double Kudomon }
  let(:defender) { instance_double Kudomon }
  subject(:attack) { Attack.new(attacker, defender) }

  its(:attacker) { is_expected.to eq attacker }
  its(:defender) { is_expected.to eq defender }

  context '#deal_damage' do
    let(:water_kudomon) { instance_double Kudomon, type: :water, combat_points: 10, health_points: 20 }
    let(:fire_kudomon) { instance_double Kudomon, type: :fire, combat_points: 10, health_points: 20 }

    it 'will do standard damage to a pokemon it is not strong against' do
      attack = Attack.new(fire_kudomon, water_kudomon)
      expect(water_kudomon).to receive(:receive_damage!).with(10)
      attack.deal_damage
    end

    it 'will do extra damage when it is strong an element' do
      attack = Attack.new(water_kudomon, fire_kudomon)
      expect(fire_kudomon).to receive(:receive_damage!).with(15)
      attack.deal_damage
    end
  end
end
