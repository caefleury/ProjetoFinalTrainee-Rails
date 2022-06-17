FactoryBot.define do 
    sequence :role_name do |i|
        "role#{i}treinee"
    end
    factory :role do 
        name {generate(:role_name)}
    end
end
