FactoryBot.define do 
    factory :member do 
        name {'Jorge'}
        role { create(:role) }
    end
end