require 'rails_helper'

RSpec.describe Service, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it {expect(build(:service)).to be_valid}
        end
    end
    describe 'validates' do
        context 'when the service has no name' do
            it {expect(build(:service, name:nil)).to be_invalid}
        end 
        context "when the name is not unique" do 
            it do
                create(:service, name:"APP")
                expect(build(:service, name:"APP")).to be_invalid
            end 
        end
    end
end