require 'rails_helper'

describe RangeBracket do
  with_model :DummyRange do
    table do |t|
      t.integer :min
      t.integer :max
    end

    model do
      include RangeBracket
    end
  end

  describe 'validation' do
    let!(:existing_range) { DummyRange.create(min: 10, max: 20) }
    subject { DummyRange.new(range_opts) }

    context 'not overlapping existing' do
      let(:range_opts) { { min: 21, max: 30 } }
      it { is_expected.to be_valid }
    end

    context 'overlapping existing' do
      let(:range_opts) { { min: 15, max: 25 } }
      it { is_expected.not_to be_valid }
    end

    context 'without minimum' do
      let(:range_opts) { { max: 5 } }
      it { is_expected.to be_valid }
    end

    context 'without maximum' do
      let(:range_opts) { { min: 25 }}
      it { is_expected.to be_valid }
    end

    context 'without either' do
      let(:range_opts) { { } }
      it { is_expected.not_to be_valid }
    end

    context 'min greater than max' do
      let(:range_opts) { { min: 30, max: 25 } }
      it { is_expected.not_to be_valid }
    end
  end
end
