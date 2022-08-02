FactoryBot.define do
  factory :payment do
    association :on_behalf_id, factory: :organisation
    association :user, factory: :users
    association :invoice, factory: :invoices
    amount { "$20.00" }
    amount_decimal { 20.00 }
    payment_method { "default" }
    payment_date { Time.now.utc }
    currency { "USD" }
  end
end
