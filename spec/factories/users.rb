FactoryBot.define do
  factory :user do
    name                  { 'abe' }
    email                 { 'aaa@gmail.com' }
    password              { '111aaa' }
    password_confirmation { '111aaa' }
  end
end
