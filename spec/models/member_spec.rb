require 'rails_helper'

RSpec.describe Member, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it { expect(build(:member)).to be_valid }
        end
    end
    describe 'validates' do
        context 'when member has no name' do
            it {expect(build(:member, name:nil)).to be_invalid}
        end
    end
end