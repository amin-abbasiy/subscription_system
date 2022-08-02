FactoryBot.define do
  factory :invoice do
    association :subscription, factory: :subscription
    title { "MyString" }
    description { "MyText" }
    user { nil }
    on_behalf_id { "" }
    amount { "1000" }
    currency { "USD" }
    pdf_url { "http://example.com/invoce.pdf" }
    status { 2 }
    start_subscription { "2022-08-02 21:33:26" }
    end_subscription { "2022-09-02 21:33:26" }
    total_amount { "10000" }
    total_amount_decimal { 10000 }
    discount { "" }
    tax_amount { "" }
    coupon { "" }
  end
end
