require 'rails_helper'

RSpec.describe Partner, type: :model do
    describe 'factory' do
        context 'when using standart factory' do
            it { expect(build(:partner)).to be_valid }
        end
    end

    describe 'validates' do
        context 'when partner has no name' do
            it {expect(build(:partner, name:nil)).to be_invalid}
        end

        context 'when partner has no link' do
            it {expect(build(:partner, link:nil)).to be_invalid}
        end
    
        context 'when name is no unique' do
                it do
                    create(:partner, name:"luiz.corp", link:"wwwpocutom")
                    expect(build(:partner, name:"luiz.corp", link:"www.com")).to be_invalid
            end 
        end

        context "when link is no unique" do
            it do
                create(:partner, name:"luiz.corp", link:"www.aaa.com")
                expect(build(:partner, name:"lui.corp", link:"www.aaa.com")).to be_invalid
            end
        end
    end
end