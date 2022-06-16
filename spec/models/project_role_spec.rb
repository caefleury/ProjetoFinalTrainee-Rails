require 'rails_helper'

RSpec.describe ProjectRole, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it { expect(build(:project_role)).to be_valid }
        end
    end
    describe 'Validates' do
        context 'when project role has no name' do
            it {expect(build(:project_role, name:nil)).to be_invalid}
        end

        context "when the name is not unique" do 
            it do
                create(:project_role, name:"DEV")
                expect(build(:project_role, name:"DEV")).to be_invalid
            end 
        end
    end
end