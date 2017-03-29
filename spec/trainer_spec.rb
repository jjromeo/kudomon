require 'spec_helper'
RSpec.describe Trainer do
  let(:position) { instance_double Position }
  let(:trainer) { Trainer.new(position: position) }

  it 'initializes with a position' do
    expect(trainer.position).to eq position
  end

  context 'catching a kudomon' do
    let(:a_kudomon) { instance_double Kudomon, position: position, name: 'Sourbulb', add_new_owner: false, caught_by?: false }

    context 'when it is nearby' do
      let(:position) { instance_double(Position, nearby?: true) }
      it 'the kudomon can be caught' do
        expect{
          trainer.capture!(a_kudomon)
        }.to change { trainer.kudomon.length }.from(0).to(1)
        expect(trainer.kudomon.first.name).to eq('Sourbulb')
      end

      it 'lets the kudomon know it was caught' do
        expect(a_kudomon).to receive(:add_new_owner).with(trainer)
        trainer.capture!(a_kudomon)
      end

      context 'when the trainer has already caught that kudomon' do
        let(:a_kudomon) { instance_double Kudomon, position: position, name: 'Sourbulb', add_new_owner: false, caught_by?: true }
        it 'the kudomon cannot be caught' do
          trainer.capture!(a_kudomon)
          expect { trainer.capture!(a_kudomon) }.not_to change { trainer.kudomon.length }
        end
      end
    end

    context 'when it is not nearby' do
      let(:position) { instance_double(Position, nearby?: false) }
      it 'the kudomon cannot be caught' do
        expect { trainer.capture!(a_kudomon) }.not_to change { trainer.kudomon.length }
      end
    end
  end
end
