FactoryBot.define do
  factory :contact do
    name { "MyString" }
    email { "MyString" }
    telephone { "MyString" }
    description { "MyText" }
    budget { "MyString" }
    service { nil }
  end
end
