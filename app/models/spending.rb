class Spending < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :category, :year_month, :value
  end
end
