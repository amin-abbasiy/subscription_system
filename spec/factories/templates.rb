FactoryBot.define do
  factory :template do
    association :user, factory: :users
    association :organiation, factory: :organiations

    title { ::Faker::Company.name }
    description { ::Faker::String.random }
  end
end
