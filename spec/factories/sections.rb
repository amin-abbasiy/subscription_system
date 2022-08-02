FactoryBot.define do
  factory :section do
    name { ::Faker::Name.name }
    referencer_id { 1 }
    referenced_id { 3 }
  end
end
