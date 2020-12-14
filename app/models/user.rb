class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :incomes
  has_many :spendings

  validates :name, presence: true
  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
end
