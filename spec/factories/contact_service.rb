FactoryBot.define do 
    factory :contact_service do 
        service { create(:service) }
        contact { create(:contact) }
    end
end