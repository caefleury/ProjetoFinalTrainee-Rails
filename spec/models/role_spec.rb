require 'rails_helper'

RSpec.describe Role, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it {expect(build(:role)).to be_valid}
        end
    end
    describe 'validates' do
        context 'when role has no name' do
            it {expect(build(:role, name:nil)).to be_invalid}
        end

        context "when the name is not unique" do 
            it do
                create(:role, name:"trainee")
                expect(build(:role, name:"trainee")).to be_invalid
            end 
        end
    end
end