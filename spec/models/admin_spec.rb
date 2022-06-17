require 'rails_helper'

RSpec.describe Admin, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it { expect(build(:admin)).to be_valid }
        end
    end

        describe 'validates' do
            context 'when admin has no email' do
                it {expect(build(:admin, email:nil)).to be_invalid}
            end

            context 'when admin has no password' do
                it {expect(build(:admin, password:nil)).to be_invalid}
            end

            context 'when email is no unique' do
                it do
                    create(:admin, email:"email@unique")
                    expect(build(:admin, email:"email@unique")).to be_invalid
                end
            end
        end
    end
        