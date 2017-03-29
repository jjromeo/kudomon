require 'spec_helper'
RSpec.describe Battle do
  let(:kudomon1) { instance_double Kudomon, attack!: false, knocked_out?: false }
  let(:kudomon2) { instance_double Kudomon, attack!: false, knocked_out?: false }
  let(:battle) { Battle.new(kudomon1, kudomon2) }

  it 'is initialized with two different kudomon' do
    expect(battle.kudomon1).to eq kudomon1
    expect(battle.kudomon2).to eq kudomon2
  end

  it 'will raise an error if done with the same kudomon' do
    expect { Battle.new(kudomon1, kudomon1) }.to raise_error 'a kudomon cannot fight itself'
  end

  it 'will randomly choose which kudomon gets to attack first' do
    srand 3
    expect(Battle.new(kudomon1, kudomon2).first_attacker).to eq kudomon1
    expect(Battle.new(kudomon1, kudomon2).first_attacker).to eq kudomon1
    expect(Battle.new(kudomon1, kudomon2).first_attacker).to eq kudomon2
  end

  it 'will have each kudomon attack the other each turn' do
    expect(kudomon1).to receive(:attack!).with(kudomon2)
    expect(kudomon2).to receive(:attack!).with(kudomon1)
    battle.turn
  end

  it 'will not play the turn and will end the game, returning the winner if a kudomon is knocked out' do
    allow(kudomon1).to receive(:knocked_out?).and_return(true)
    expect(battle).to receive(:end_battle!).and_return(kudomon2)
    battle.turn
  end

  context '#start_battle' do
    let(:kudomon1) { instance_double Kudomon, attack!: false, knocked_out?: true }
    it 'will end once the battle has finished and return the winner' do
      battle.start_battle!
      expect(battle.winner).to eq kudomon2
    end
  end
end
