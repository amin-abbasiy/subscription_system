FactoryBot.define do
  factory :text_section do
    title { "Title" }
    body { ::Faker::String.random }
  end
end
