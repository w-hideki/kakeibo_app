FactoryBot.define do
  factory :spending do
    category { '食費' }
    year_month            { '2020-05-14' }
    value                 { '5000' }
    association :user
  end
end
