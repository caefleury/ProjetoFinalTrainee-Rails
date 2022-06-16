require 'rails_helper'

RSpec.describe ProjectMember, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it { expect(build(:project_member)).to be_valid }
        end
    end
end