FactoryBot.define do 
    factory :project_service do 
        project {create(:project)}
        service {create(:service)}
    end
end