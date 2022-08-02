FactoryBot.define do
  factory :plan do
    title { "StartUp" }
    amount { "$20.00" }
    interval { 0 }
    interval_count { 1 }
    quantity { 1 }
    additional_user_rate { "MyString" }
    currency { "USD" }
    trial_days { 7 }
    status { 0 }
  end
end
