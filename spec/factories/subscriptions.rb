FactoryBot.define do
  factory :subscription do
    association :subscriber, factory: :users
    association :plan, factory: :plans
    association :last_invoice, factory: :invoice

    currency { Faker::Currency.code }
    current_period_start { Faker::Date.in_date_period(year: 2022, month: 2) }
    current_period_end { Faker::Date.in_date_period(year: 2022, month: 3) }
    default_payment_method { "default" }
    description { ::Faker::String.random }
    status { 3 }
    canceled_at { nil }
    cancelation_reason { nil }
    discount { nil }
    trial_start { Time.now.utc }
    trial_end { Time.now.utc + 7.days }
    interval { 0 }
    interval_count { 1 }
  end
end
