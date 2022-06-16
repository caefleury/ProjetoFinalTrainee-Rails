require 'rails_helper'

RSpec.describe ProjectService, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it {expect(build(:project_service)).to be_valid}
        end
    end
end