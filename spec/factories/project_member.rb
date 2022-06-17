FactoryBot.define do 
    factory :project_member do 
        member { create(:member) }
        project { create(:project) }
        project_role { create(:project_role)}
    end
end