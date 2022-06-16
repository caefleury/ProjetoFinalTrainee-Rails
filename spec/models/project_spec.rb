require 'rails_helper'

RSpec.describe Project, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it { expect(build(:project)).to be_valid }
        end
    end
    describe 'validates' do
        context 'when project has no name' do
            it {expect(build(:project, name:nil)).to be_invalid}
        end

        context 'when project has no description' do
            it {expect(build(:project, description:nil)).to be_invalid}
        end

        context 'when project has no link' do
            it {expect(build(:project, link:nil))}
        end

        context 'when name is no unique' do
            it do
                create(:project, name:"projeto final", link:"www.projeto.com")
                expect(build(:project, name:"projeto final", link:"www.projeto.com.br")).to be_invalid
            end

            context 'when link is no unique'
            it do
                create(:project, name:"projeto_final1", link:"www.projeto.com")
                expect(build(:project, name:"projeto_final", link:"www.projeto.com")).to be_invalid
            end
        end
    end
end