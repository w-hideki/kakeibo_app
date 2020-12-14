FactoryBot.define do
  factory :income do
    category              {"給料"}
    year_month            {"2020-05-14"}
    value                 {"5000"}
    association :user
  end
end
