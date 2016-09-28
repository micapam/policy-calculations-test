require 'rails_helper'

RSpec.describe Quote, type: :model do

  it { is_expected.to validate_presence_of :age }
  it { is_expected.to validate_presence_of :trip_duration }

  describe '#price' do
    let(:young) { Fabricate(:age_bracket, max: 99) } # lol
    let(:old) { Fabricate(:age_bracket, min: 100) }
    let(:short) { Fabricate(:trip_duration_bracket, max: 9) }
    let(:long) { Fabricate(:trip_duration_bracket, min: 10) }
    let!(:young_short) { Fabricate(:price, age_bracket: young, trip_duration_bracket: short) }
    let!(:young_long) { Fabricate(:price, age_bracket: young, trip_duration_bracket: long) }
    let!(:old_short) { Fabricate(:price, age_bracket: old, trip_duration_bracket: short) }
    let!(:old_long) { Fabricate(:price, age_bracket: old, trip_duration_bracket: long) }

    subject { Fabricate(:quote, age: age, trip_duration: trip_duration) }

    context 'young' do
      let(:age) { 20 }

      context 'short' do
        let(:trip_duration) { 5 }
        specify { expect(subject.price).to eq young_short }
      end

      context 'long' do
        let(:trip_duration) { 15 }
        specify { expect(subject.price).to eq young_long }
      end
    end

    context 'old' do
      let(:age) { 120 }

      context 'short' do
        let(:trip_duration) { 5 }
        specify { expect(subject.price).to eq old_short }
      end

      context 'long' do
        let(:trip_duration) { 15 }
        specify { expect(subject.price).to eq old_long }
      end
    end
  end
end
