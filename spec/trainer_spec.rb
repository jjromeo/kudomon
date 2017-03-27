require 'spec_helper'
RSpec.describe Trainer do
  let(:position) { double :position }
  let(:trainer) { Trainer.new(position: position) }

  it 'initializes with a position' do
    expect(trainer.position).to eq position
  end

  context 'catching a kudomon' do
    let(:a_kudomon) { double :kudomon, position: position }
    context 'when it is nearby' do
      let(:position) { double(:position, nearby?: true) }
      it 'the kudomon can be caught' do
        trainer.capture(a_kudomon)
        expect(trainer.kudomon).to include(a_kudomon)
      end
    end

    context 'when it is not nearby' do
      let(:position) { double(:position, nearby?: false) }
      it 'the kudomon cannot be caught' do
        trainer.capture(a_kudomon)
        expect(trainer.kudomon).not_to include(a_kudomon)
      end
    end
  end
end
