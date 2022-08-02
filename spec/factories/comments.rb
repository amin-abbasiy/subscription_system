FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    association :section, factory: :section
    association :template, factory: :template
    content { ::Faker::String.random }
    parent_id { 1 }
    name { ::Faker::Name.name }
    email { ::Faker::Internet.email }
  end
end
