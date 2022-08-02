FactoryBot.define do
  factory :list_section do
    title { Faker::Name.unique.clear }
    list { { agree_term: true } }
  end
end
