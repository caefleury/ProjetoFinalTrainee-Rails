require 'rails_helper'

RSpec.describe ContactService, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it { expect(build(:contact_service)).to be_valid }
        end
    end
end