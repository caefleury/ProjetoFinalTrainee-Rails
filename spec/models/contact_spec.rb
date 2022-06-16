require 'rails_helper'

RSpec.describe Contact, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it { expect(build(:contact)).to be_valid }
        end
    end

    describe 'validates' do
        context 'when contact has no name' do
            it {expect(build(:contact, name:nil)).to be_invalid}
        end

        context 'when contact has no email' do
            it {expect(build(:contact, email:nil)).to be_invalid}
        end

        context 'when contact has no telephone' do
            it {expect(build(:contact, telephone:nil)).to be_invalid}
        end

        context 'when contact has no description' do
            it {expect(build(:contact, description:nil)).to be_invalid}
        end

        context 'when contact has no budget' do
            it {expect(build(:contact, budget:nil)).to be_invalid}
        end

        context 'when contact has no date' do
            it {expect(build(:contact, date:nil)).to be_invalid}
        end

        context 'when email is no unique' do
            it do
                create(:contact, email:"Caetano@Caetano", telephone:"999998")
                expect(build(:contact, email:"Caetano@Caetano", telephone:"99999")).to be_invalid
            end

            context 'when telephone is no unique' do
                it do
                    create(:contact, email:"Caetano@Caetanoo", telephone:"99999")
                    expect(build(:contact, email:"Caetano@Caetano", telephone:"99999")).to be_invalid
                 end
            end
        end
    end
end