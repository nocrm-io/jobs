require 'rails_helper'

describe Lead do

  describe 'Validations' do

    describe 'name' do

      context 'with name' do
        subject { build :lead, name: nil }
        it { expect(subject).to_not be_valid }
      end

      context 'without name' do
        subject { build :lead }
        it { expect(subject).to be_valid }
      end

    end

    describe 'status' do

      context 'default todo status' do
        subject { build :lead }
        it { expect(subject).to be_valid }
      end

      context 'without valid status' do
        subject { build :lead, status: 'standby' }
        it { expect(subject).to be_valid }
      end

      context 'without invalid status' do
        subject { build :lead, status: 'foo' }
        it { expect(subject).not_to be_valid }
      end

    end

  end

end
