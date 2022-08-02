FactoryBot.define do
  factory :organisation do
    name { "Organisation" }
    employee_range { 1 }
    ext_id %q{1–50(small)}
    access_code { "CDI110" }
    status { 0 }
  end
end
